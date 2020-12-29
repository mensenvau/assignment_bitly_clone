const express = require("express")
const app = express()
const pool = require("../db/db")

app.use("/auth", require("./auth"))
app.use("/user", [require("./isAuth")], require("./user"))

app.use("/t/:id", (req, res) => {
    pool.query("SELECT *FROM linklist  WHERE lto=? ; UPDATE linklist SET linklist.click=linklist.click+1 WHERE lto=?;  ", [req.params.id, req.params.id], (err, rows, fld) => {
        if (err) {
            return res.redirect("/auth?Xatolik bu id mavjud !. ")
        }
        res.redirect(rows[0][0].lfrom)
    })
})

app.use("/*", (req, res) => {
    res.redirect("/auth")
})

module.exports = app