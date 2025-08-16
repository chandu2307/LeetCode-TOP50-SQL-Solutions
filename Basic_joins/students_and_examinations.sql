with students_data as(
    select
        a.student_id,
        a.student_name,
        b.subject_name
    from
        Students a cross join Subjects b
),
attended_exams_data as(
    select
        a.student_id,
        a.student_name,
        a.subject_name,
        count(b.subject_name) as attended_exams
    from
        students_data a
            left join
        Examinations b
    on
        a.student_id = b.student_id and
        a.subject_name = b.subject_name
    group by
        a.student_id,a.subject_name
    order by
        a.student_id, a.subject_name
)
select * from attended_exams_data
