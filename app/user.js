const express = require("express")
const app = express()
const pool = require("../db/db")
const shortid = require('shortid');
require('dotenv').config()

app.get("/", (req, res) => {
    res.render("user/index")
})

app.get("/url", (req, res) => {
    let id = shortid.generate();
    console.log(1)
    pool.query("INSERT INTO linklist (lfrom , lto , date , click,userid) VALUES (?, ?,now(),0,?) ; ", [req.query.url, id, req.userid, id],
        (err, rows, fld) => {
            if (err) {
                return res.redirect("/user?Xatolik bu url mavjud !. ")
            }
            res.redirect("/user/detale/" + rows.insertId);
        })
})


app.get("/detale/:id", (req, res) => {
    pool.query("SELECT *FROM linklist  WHERE id=? ", [req.params.id], (err, rows, fld) => {
        if (err) {
            return res.redirect("/user?Xatolik bu id mavjud !. ")
        }
        res.render("user/detale", { data: rows[0], host: process.env.HOST })
    })
})


app.get("/linklist", (req, res) => {
    pool.query("SELECT *FROM linklist  where userid=?", [req.userid], (err, rows, fld) => {
        if (err) {
            return res.redirect("/user?Xatolik bu id mavjud !. ")
        }
        res.render("user/linklist", { data: rows, host: process.env.HOST })
    })
})


app.get("/out", (req, res) => {
    delete req.session.userid
    res.redirect("/")
})


module.exports = app