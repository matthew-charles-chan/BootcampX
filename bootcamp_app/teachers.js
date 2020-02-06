const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
})


const arguments = process.argv.slice(2);

// pool.query(`
// SELECT students.id as student_id, students.name as student_name, cohorts.name as cohort_name
// FROM students
// JOIN cohorts on cohort_id = cohorts.id
// WHERE cohorts.name LIKE '%${arguments[0]}%'
// LIMIT ${arguments[1] || 5};
// `)
// .then(res => {
//   res.rows.forEach(user => {
//     console.log(`${user.student_name} has an id of ${user.student_id} and was in the ${user.cohort_name} cohort`)
//   })
// })
// .catch(err => {console.log('query error', err.stack)});


pool.query(`
  
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests on teachers.id = teacher_id
JOIN students on student_id = students.id
JOIN cohorts on cohort_id = cohorts.id
WHERE cohorts.name = '${arguments[0]}'
ORDER BY teachers.name;

`)
.then( res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`)
  })
})
.catch(err => {console.log('query error', err.stack)});