const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})


const arguments = process.argv.slice(2);
const cohortName = arguments[0];
const limit = arguments[1] || 5;

const values = [`%${cohortName}%`, limit]

pool.query(`
SELECT students.id as student_id, students.name as student_name, cohorts.name as cohort_name
FROM students
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student_name} has an id of ${user.student_id} and was in the ${user.cohort_name} cohort`)
  })
})
.catch(err => {console.log('query error', err.stack)});