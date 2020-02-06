const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})


const arguments = process.argv.slice(2);

const values = [`${arguments[0]}`];

pool.query(`
  
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests on teachers.id = teacher_id
JOIN students on student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teachers.name;

`, values)
.then( res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`)
  })
})
.catch(err => {console.log('query error', err.stack)});