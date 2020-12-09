package dao;

import metier.entities.Produit;

import java.util.List;

public interface IProduitDao {
    public Produit save(Produit p);
    public List<Produit> produitsParMC(String mc);
    public Produit getProduit(Long id);
    public Produit update(Produit p);
    public void deleteProduit(Long id);
}
