package br.com.demos.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "respostas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Respostas.findAll", query = "SELECT r FROM Respostas r"),
    @NamedQuery(name = "Respostas.findById", query = "SELECT r FROM Respostas r WHERE r.id = :id"),
    @NamedQuery(name = "Respostas.findByIdpergunta", query = "SELECT r FROM Respostas r WHERE r.idpergunta = :idpergunta"),
    @NamedQuery(name = "Respostas.findByResposta", query = "SELECT r FROM Respostas r WHERE r.resposta = :resposta"),
    @NamedQuery(name = "Respostas.findByDtcreate", query = "SELECT r FROM Respostas r WHERE r.dtcreate = :dtcreate")})
@Getter
@Setter
public class Respostas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "idpergunta")
    private long idpergunta;
    @Basic(optional = false)
    @Column(name = "resposta")
    private String resposta;
    @Basic(optional = false)
    @Column(name = "dtcreate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dtcreate;

    public Respostas() {
    }



    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Respostas)) {
            return false;
        }
        Respostas other = (Respostas) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.com.demo.vo.Respostas[ id=" + id + " ]";
    }
    
}
