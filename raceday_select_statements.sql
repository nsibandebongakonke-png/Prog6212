-- ============================================
-- RaceDay Database — SELECT Statements
-- One basic SELECT per table, plus a few
-- practical joined queries used by the API.
-- ============================================

USE RaceDay;

-- ---------- Basic SELECTs (one per table) ----------

-- All roles
SELECT role_id, role_name
FROM role;

-- All users
SELECT user_id, role_id, first_name, last_name, email, phone, profile_pic
FROM user;

-- All events
SELECT event_id, organiser, event_name, description, event_date,
       location, distance, event_type, banner_image
FROM event;

-- All enrolments
SELECT enroll_id, participant, event_id, enrol_date, status
FROM enrolment;

-- All supporting documents
SELECT document_id, enroll_id, file_name, file_path, status
FROM supporting_document;

-- All race results
SELECT result_id, enroll_id, finish_time, position, published
FROM race_result;

-- All categories
SELECT category_id, event_id, category_name, description
FROM category;


-- ---------- Joined / practical queries ----------

-- 1. Every user with their role name
SELECT u.user_id, u.first_name, u.last_name, u.email, r.role_name
FROM user u
JOIN role r ON u.role_id = r.role_id;

-- 2. Every event with its organiser's name
SELECT e.event_id, e.event_name, e.event_date, e.location,
       u.first_name AS organiser_first_name, u.last_name AS organiser_last_name
FROM event e
JOIN user u ON e.organiser = u.user_id;

-- 3. Categories offered for one event (replace :event_id)
SELECT category_id, category_name, description
FROM category
WHERE event_id = :event_id;

-- 4. Everyone enrolled in one event, with their status (replace :event_id)
SELECT en.enroll_id, u.first_name, u.last_name, u.email,
       en.enrol_date, en.status
FROM enrolment en
JOIN user u ON en.participant = u.user_id
WHERE en.event_id = :event_id;

-- 5. A single participant's own enrolments, with event details
SELECT en.enroll_id, ev.event_name, ev.event_date, en.status
FROM enrolment en
JOIN event ev ON en.event_id = ev.event_id
WHERE en.participant = :user_id;

-- 6. Supporting documents submitted for one enrolment (replace :enroll_id)
SELECT document_id, file_name, file_path, status
FROM supporting_document
WHERE enroll_id = :enroll_id;

-- 7. Published race results (leaderboard) for one event, ordered by position
SELECT u.first_name, u.last_name, rr.finish_time, rr.position
FROM race_result rr
JOIN enrolment en ON rr.enroll_id = en.enroll_id
JOIN user u ON en.participant = u.user_id
WHERE en.event_id = :event_id
  AND rr.published = TRUE
ORDER BY rr.position ASC;

-- 8. A single participant's personal race history (all events, all results)
SELECT ev.event_name, ev.event_date, rr.finish_time, rr.position
FROM race_result rr
JOIN enrolment en ON rr.enroll_id = en.enroll_id
JOIN event ev ON en.event_id = ev.event_id
WHERE en.participant = :user_id
ORDER BY ev.event_date DESC;

-- 9. Enrolments still pending document approval
SELECT en.enroll_id, u.first_name, u.last_name, sd.file_name, sd.status
FROM enrolment en
JOIN user u ON en.participant = u.user_id
JOIN supporting_document sd ON sd.enroll_id = en.enroll_id
WHERE sd.status = 'pending';

-- 10. Count of enrolments per event, by status
SELECT ev.event_name, en.status, COUNT(en.enroll_id) AS total
FROM event ev
JOIN enrolment en ON en.event_id = ev.event_id
GROUP BY ev.event_name, en.status;

-- Note: `enrolment` has no category_id column, so a participant's chosen
-- category can't be queried from the current schema — category is only
-- linked to event, not to enrolment. Add a category_id FK on `enrolment`
-- if you need per-category counts or per-category rosters.
