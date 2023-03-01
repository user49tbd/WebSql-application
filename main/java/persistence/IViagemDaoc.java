package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Onibus;
import model.Viagem;

public interface IViagemDaoc {
		public List<Viagem> ConsultaViagems() throws SQLException,ClassNotFoundException;
		public List<Onibus> ConsultaOnibus() throws SQLException,ClassNotFoundException;
}
