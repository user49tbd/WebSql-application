package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Onibus;
import model.Viagem;

public class ViagemDao implements IViagemDaoc{
	private Connection c;
	private GenericDao gd;
	public ViagemDao() {
		gd = new GenericDao();
		try {
			c = gd.getC();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Viagem> ConsultaViagems() throws SQLException, ClassNotFoundException {
		String sql="SELECT * FROM V_DESCRICAO_VIAGEM";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Viagem> ar = new ArrayList<Viagem>();
		while(rs.next()) {
			Viagem v = new Viagem();
			v.setCodigo(rs.getInt("CODIGO"));
			v.setOnibus(rs.getString("PLACA_DO_ONIBUS"));
			v.setHoraS(rs.getString("HORA_DE_SAIDA"));
			v.setHoraC(rs.getString("HORA_DE_CHEGADA"));
			v.setPartida(rs.getString("PARTIDA"));
			v.setDestino(rs.getString("DESTINO"));
			ar.add(v);
		}
		rs.close();
		ps.close();
		return ar;
	}

	@Override
	public List<Onibus> ConsultaOnibus() throws SQLException, ClassNotFoundException {
		String sql="SELECT * FROM V_DESCRICAO_ONIBUS";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Onibus> ar = new ArrayList<Onibus>();
		while(rs.next()) {
			Onibus o = new Onibus();
			o.setCodigo(rs.getInt("CODIGO"));
			o.setNome(rs.getString("NOME_DO_MOTORISTA"));
			o.setPlaca(rs.getString("PLACA_DO_ONIBUS"));
			o.setMarca(rs.getString("MARCA"));
			o.setAno(rs.getInt("ANO"));
			o.setDescricao(rs.getString("DESCRICAO"));
			ar.add(o);
		}
		rs.close();
		ps.close();
		return ar;
	}

}
