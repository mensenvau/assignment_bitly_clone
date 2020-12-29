let auth = (req, res, next) => {
    if (req.session.userid) {
        req.userid = req.session.userid
        return next();
    }
    res.redirect("/auth")
}


module.exports = auth