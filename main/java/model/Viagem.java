package model;

public class Viagem {
	private int		codigo;
	private String	onibus;
	private String	horaS;
	private String	horaC;
	private String	partida;
	private String	destino;
	
	public String getHoraS() {
		return horaS;
	}
	public void setHoraS(String horaS) {
		this.horaS = horaS;
	}
	public String getHoraC() {
		return horaC;
	}
	public void setHoraC(String horaC) {
		this.horaC = horaC;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getOnibus() {
		return onibus;
	}
	public void setOnibus(String onibus) {
		this.onibus = onibus;
	}
	public String getPartida() {
		return partida;
	}
	public void setPartida(String partida) {
		this.partida = partida;
	}
	public String getDestino() {
		return destino;
	}
	public void setDestino(String destino) {
		this.destino = destino;
	}
	@Override
	public String toString() {
		return "Viagem [codigo=" + codigo + ", onibus=" + onibus + ", motorista=" + motorista + ", horaS=" + horaS
				+ ", horaC=" + horaC + ", partida=" + partida + ", destino=" + destino + "]";
	}
	
	
}
