import mysql, { Connection } from 'mysql2/promise';

export async function connectDB(): Promise<Connection> {
  const connection = await mysql.createConnection({
    host: 'localhost',      // tu host (puede ser 127.0.0.1)
    user: 'root',           // tu usuario de phpMyAdmin
    password: '',           // tu contraseña si tienes una
    database: 'at91' // remplaza con el nombre de tu BD
  });
  return connection;
}
