module.exports = (sequelize, type) => {
    return sequelize.define('user', {
        id: {
            type: type.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        username: type.STRING,
        name: type.STRING,
        lastname: type.STRING,
        email: type.STRING,
        phone: type.STRING(32),
        direction: type.STRING,
        password: type.STRING,
        admin: type.INTEGER
    })
}