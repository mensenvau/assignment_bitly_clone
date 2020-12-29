const express = require("express")
const app = express()
const pool = require("../db/db")
const bcrypt = require('bcryptjs');

app.get("/", (req, res) => {
    res.render("auth/index")
})

app.get("/sign-in", (req, res) => {
    res.render("auth/sign-in", { msg: "" })
})

app.get("/sign-up", (req, res) => {
    res.render("auth/sign-up", { msg: "" })
})


app.post("/sign-in", (req, res) => {
    pool.query("SELECT *FROM users WHERE email =?", [req.body.email],
        (err, rows, fld) => {
            if (err || rows.length == 0) {
                return res.render("auth/sign-in", { msg: "Bu email foydalanuvchi mavjud emas . " })
            }
            const isUser = bcrypt.compareSync(String(req.body.psw), rows[0].password);
            if (isUser) {
                req.session.userid = rows[0].id
                res.redirect("/user")
                return;
            }
            res.render("auth/sign-in", { msg: "Parol xato kirtingiz . " })
        })
})

app.post("/sign-up", (req, res) => {
    const salt = bcrypt.genSaltSync(5);
    const hash = bcrypt.hashSync(req.body.psw, salt);
    pool.query("INSERT INTO users (email , password) VALUES (?, ?)", [req.body.email, hash],
        (err, rows, fld) => {
            if (err) {
                return res.render("auth/sign-up", { msg: "Bu email foydalanuvchi mavjud . " })
            }
            res.render("auth/sign-up", { msg: "Ro'yxadan o'tingiz ." })
        })
})

module.exports = app