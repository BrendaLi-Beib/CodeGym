-- populate users
DELETE
FROM USERS;
alter
sequence USERS_ID_SEQ restart with 1;
insert into USERS (EMAIL, PASSWORD, FIRST_NAME, LAST_NAME, DISPLAY_NAME, startpoint)
values ('user@gmail.com', '{noop}password', 'userFirstName', 'userLastName', 'userDisplayName', now()),
       ('admin@gmail.com', '{noop}admin', 'adminFirstName', 'adminLastName', 'adminDisplayName','12-12-25'),
       ('guest@gmail.com', '{noop}guest', 'guestFirstName', 'guestLastName', 'guestDisplayName','12-12-25'),
       ('manager@gmail.com', '{noop}manager', 'managerFirstName', 'managerLastName', 'managerDisplayName','12-12-25'),
       ('taras@gmail.com', '{noop}password', 'Taras', 'Shevchenko', '@taras','12-12-25'),
       ('sjones80@gmail.com', '{noop}password', 'Simon', 'Jones', '@sjones80','12-12-25'),
       ('moroz_a@gmail.com', '{noop}password', 'Alex', 'Moroz', '@Moroz93','12-12-25'),
       ('antonio.nest@gmail.com', '{noop}password', 'Antonio', 'Nest', '@antonio_nest',now()),
       ('i.franko@gmail.com', '{noop}password', 'Ivan', 'Franko', '@ifranko','12-12-25'),
       ('g.skovoroda@gmail.com', '{noop}password', 'Gregory', 'Skorovoda', '@Gregory24',now()),
       ('arsh.and@gmail.com', '{noop}password', 'Andrew', 'Arsh', '@arsh01',now()),
       ('squirrel2011@gmail.com', '{noop}password', 'Lucy', 'Ivansson', '@SmallSquirrel',now()),
       ('nikk24@gmail.com', '{noop}password', 'Nikolai', 'Petterson', '@nikk','12-12-25'),
       ('artem711@gmail.com', '{noop}password', 'Artem', 'Zaza', '@Artt', now()),
       ('max.pain@gmail.com', '{noop}password', 'Max', 'Dudnik', '@MaxPain', now()),
       ('admin@aws.co', '{noop}password', 'test', 'admin', '@testAdmin',now()),
       ('brenda@gmail.com', '{noop}Brenda27', 'Brenda', 'Becerra', '@BrenDali','12-27-96');

-- 0 DEV
-- 1 ADMIN
-- 2 MANAGER
DELETE
FROM USER_ROLE;
insert into USER_ROLE (USER_ID, ROLE)
values (1, 0),
       (2, 0),
       (3, 1),
       (4, 2),
       (5, 0),
       (6, 0),
       (7, 0),
       (8, 0),
       (9, 0),
       (10, 0),
       (11, 0),
       (12, 0),
       (13, 0),
       (14, 0),
       (15, 1),
       (16, 1),
       (17, 2);

insert into PROFILE (ID, LAST_FAILED_LOGIN, LAST_LOGIN, MAIL_NOTIFICATIONS)
values (1, '11-03-2025', null, 11),
       (2, null, null, 12),
       (3, null, null, 1),
       (4, null, null, 20),
       (17,'12-27-23', null,17);

insert into CONTACT (ID, CODE, VALUE)
values (1, 'skype', 'userSkype'),
       (1, 'mobile', '+01234567890'),
       (1, 'website', 'user.com'),
       (2, 'github', 'adminGitHub'),
       (2, 'telegram', 'adminTg'),
       (2, 'facebook', 'adminFb'),
       (17,'github','BrendaGithub');

delete
from ATTACHMENT;
alter
sequence ATTACHMENT_ID_SEQ restart with 1;
insert into ATTACHMENT (name, file_link, object_id, object_type, user_id, date_time)
values ('Screenshot 1.png', './attachments/project/1_Screenshot 1.png', 2, 0, 4, '2023-05-04 22:28:50.215429'),
       ('Screenshot 2.png', './attachments/project/2_Screenshot 2.png', 2, 0, 4, '2023-05-04 22:28:53.687600'),
       ('Daily-checklist.xlsx', './attachments/project/3_Daily-checklist.xlsx', 2, 0, 4,
        '2023-05-04 22:31:15.166547'),
       ('Screenshot 1.png', './attachments/task/1_Screenshot 1.png', 41, 2, 4, '2023-05-04 22:28:53.687600'),
       ('Screenshot 2.png', './attachments/task/2_Screenshot 2.png', 41, 2, 4, '2023-05-04 22:28:50.215429'),
       ('Daily-checklist.xlsx', './attachments/task/3_Daily-checklist.xlsx', 1088, 2, 17,
        '2023-05-04 22:28:50.215429');
alter
sequence ATTACHMENT_ID_SEQ restart with 1000;

-- populate tasks
delete
from TASK;
alter
sequence TASK_ID_SEQ restart with 1;
delete
from SPRINT;
alter
sequence SPRINT_ID_SEQ restart with 1;
delete
from PROJECT;
alter
sequence PROJECT_ID_SEQ restart with 1;
delete
from ACTIVITY;
alter
sequence ACTIVITY_ID_SEQ restart with 1;

insert into PROJECT (code, title, description, type_code, parent_id,startpoint)
values ('CodegymJira', 'CodegymJira', '«Mini-JIRA» app : project management system tutorial app', 'task_tracker', null, now()),
       ('Test_Project', 'Test Project', 'Just test project', 'task_tracker', null, now()),
       ('Test_Project_2', 'Test Project 2', 'Just test project 2', 'task_tracker', null, now()),
       ('CodegymJira sub', 'CodegymJira subproject', 'subproject', 'task_tracker', 1, now()),
       ('Brenda_Project', 'CodegymBrenda proyecto', 'subproyecto', 'task_tracker', 1, now());
alter
sequence PROJECT_ID_SEQ restart with 1000;

insert into SPRINT (status_code, startpoint, endpoint, code, project_id)
values ('active', now(), null, 'Sprint-2', 1),
       ('finished', '2023-04-09 08:05:10', '2023-04-29 16:48:34', 'Sprint-1', 2),
       ('finished', '2023-04-03 12:14:11', '2023-04-18 17:03:41', 'Sprint-2', 2),
       ('active', '2023-04-05 14:25:43', '2023-06-10 13:00:00', 'Sprint-3', 2),
       ('active', now(), null, 'Sprint-1', 4),
       ('active',now(),'2025-06-06 1:45:00','Sprint-17',5);
alter
sequence SPRINT_ID_SEQ restart with 1000;

---- project 1 -------------
INSERT INTO TASK (TITLE, TYPE_CODE, STATUS_CODE, PROJECT_ID, SPRINT_ID, STARTPOINT)
values ('Data', 'epic', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Trees', 'epic', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI', 'epic', 'in_progress', 1, 1, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Sprint', 'epic', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Project', 'epic', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Task', 'epic', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Attachments', 'story', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Dashboard', 'epic', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Report of Sprint (UI)', 'story', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Organizational-architectural', 'epic', 'in_progress', 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'), ---- project 2 -------------
       ('Title', 'task', 'todo', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'canceled', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_test', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_test', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_test', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'story', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'bug', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'epic', 'in_progress', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_review', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_review', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'story', 'ready_for_test', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'review', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'bug', 'review', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'epic', 'test', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'story', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'bug', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'canceled', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'canceled', 2, 2, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_test', 2, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'in_progress', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 3, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_test', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_test', 2, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'story', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'bug', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'todo', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'epic', 'in_progress', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_review', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'ready_for_review', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'story', 'ready_for_test', 2, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'review', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'bug', 'review', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'test', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'epic', 'test', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'story', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'bug', 'done', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Title', 'task', 'canceled', 2, 4, now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('subproject sprint task', 'epic', 'in_progress', 4, 5,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('subproject backlog task', 'epic', 'in_progress', 4, null,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
        ('Dashboard','task','review',5,5, now() + random() * interval '5 minutes' + random() * interval '20 seconds');

INSERT INTO TASK (TITLE, TYPE_CODE, STATUS_CODE, PROJECT_ID, SPRINT_ID, PARENT_ID, STARTPOINT)
values ('Add role manager and filters in security', 'task', 'done', 1, 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Add users from task-timing', 'task', 'ready_for_review', 1, 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Add tasks-2 in DB', 'task', 'in_progress', 1, 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Remove reference with USER_TYPE IN (3,4,5)', 'task', 'in_progress', 1, 1, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('REST API for trees', 'task', 'in_progress', 1, 1, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Drawing in trees', 'task', 'in_progress', 1, 1, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Context menu', 'task', 'in_progress', 1, 1, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Reassignment sprint', 'task', 'in_progress', 1, 1, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Add task, subtask, sprint, subsprint', 'task', 'in_progress', 1, 1, 2,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Make layout for view TitleTo', 'task', 'in_progress', 1, 1, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Make layout for edit TitleTo', 'task', 'in_progress', 1, 1, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Fix header-fragment', 'task', 'ready_for_review', 1, 1, 3,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('REST API', 'task', 'in_progress', 1, 1, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Tests', 'task', 'in_progress', 1, 1, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI view, mock button to dashboard', 'task', 'in_progress', 1, 1, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI edit', 'task', 'in_progress', 1, 1, 4,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('REST API', 'task', 'in_progress', 1, 1, 5,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Tests', 'task', 'in_progress', 1, 1, 5,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI view, mock button to dashboard', 'task', 'in_progress', 1, 1, 5,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI edit', 'task', 'in_progress', 1, 1, 5,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('REST API', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Tests', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI view, mock button to dashboard', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI edit', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI view add to Task, mock button to dashboard', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI edit add to Task', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Edit changelog with changes of Task model', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('REST API: changeStatus', 'task', 'in_progress', 1, 1, 6,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Make columns with tasks', 'task', 'in_progress', 1, 1, 8,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('UI tab of tasks', 'task', 'in_progress', 1, 1, 8,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Context mune', 'task', 'in_progress', 1, 1, 8,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Duration, count of tasks, elapsed time', 'task', 'in_progress', 1, 1, 9,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Meeting, dividing tasks', 'task', 'in_progress', 1, 1, 10,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Refactoring packages', 'task', 'in_progress', 1, 1, 10,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Refactoring tasks', 'task', 'in_progress', 1, 1, 10,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Subproject sprint subtask', 'task', 'in_progress', 4, 5, 87,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Subproject backlog subtask', 'task', 'in_progress', 4, null, 88,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds'),
       ('Project Brenda', 'task', 'in_progress', 5, 6, 1,
        now() + random() * interval '5 minutes' + random() * interval '20 seconds');
alter
sequence TASK_ID_SEQ restart with 1000;

---task 1------
INSERT INTO ACTIVITY(AUTHOR_ID, TASK_ID, UPDATED, COMMENT, TITLE, DESCRIPTION, ESTIMATE, TYPE_CODE, STATUS_CODE,
                     PRIORITY_CODE)
values (6, 1, '2023-05-15 09:05:10', null, 'Data', null, 3, 'epic', 'in_progress', 'low'),
       (5, 1, '2023-05-15 12:25:10', null, 'Data', null, 3, 'epic', 'ready_for_review', 'normal'),
       (6, 1, '2023-05-15 14:05:10', null, 'Data', null, 4, 'epic', 'done', null), ---task 118----
       (11, 118, '2023-05-16 10:05:10', null, 'UI tab of tasks', null, 4, 'task', 'in_progress', 'normal'),
       (5, 118, '2023-05-16 11:10:10', null, 'UI tab of tasks', null, 3, 'task', 'done', 'high'),
       (11, 118, '2023-05-16 12:30:10', null, 'UI tab of tasks', null, 2, 'task', 'ready_for_review', 'normal'),
       (17,1088,now(),'All of comment are null','Dashboard', 'All of descripcion are null',27, 'epic',  'in_progress','high');

INSERT INTO reference (ref_type, code,startpoint,title)

VALUES (1,'CodegymJira',now(),'Data'),
       (1,'Brenda_Proyect',now(),'UI tab of task'),
       (2, 'subproject sprint task',now(),'Dashboard');

INSERT INTO user_belong (object_id, object_type, user_id, user_type_code,startpoint)

VALUES (5,2,4,1, now()),
       (1,1,4,2, now()),
       (3,3,3,3, now()),
       (118,3,17,1 , now());

