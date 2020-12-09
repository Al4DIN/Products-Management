package web;

import dao.IProduitDao;
import dao.ProduitDaoImpl;
import metier.entities.Produit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ControleurServlet extends HttpServlet {
    private IProduitDao metier;

    @Override
    public void init()  {
        metier = new ProduitDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/index.php")) {
            req.getRequestDispatcher("produits.jsp").forward(req, resp);
        }
        else if (path.equals("/chercher.php")){
            String motCle=req.getParameter("motCle");
            ProduitModel model=new ProduitModel();
            model.setMotCle(motCle);
            List<Produit> produits=metier.produitsParMC("%"+motCle+"%");
            model.setProduits(produits);
            req.setAttribute("model",model);
            req.getRequestDispatcher("produits.jsp").forward(req,resp);
        }
        else if (path.equals("/saisie.php")){
            req.setAttribute("produit",new Produit());
            req.getRequestDispatcher("SaisieProduit.jsp").forward(req,resp);
        }
        else if (path.equals("/SaveProduit.php") && req.getMethod().equals("POST")){
            String des=req.getParameter("designation");
            double prix=Double.parseDouble(req.getParameter("prix"));
            int quantite=Integer.parseInt(req.getParameter("quantite"));
            Produit p=metier.save(new Produit(des,prix,quantite));
            req.setAttribute("produit",p);
            req.getRequestDispatcher("Confirmation.jsp").forward(req,resp);
        }
        else if (path.equals("/Supprimer.php")){
            Long id =Long.parseLong(req.getParameter("id"));
            metier.deleteProduit(id);
            //req.getRequestDispatcher("produits.jsp").forward(req,resp);
            resp.sendRedirect("chercher.php?motCle=");
        }
        else if (path.equals("/Edit.php")) {
            Long id = Long.parseLong(req.getParameter("id"));
            Produit p = metier.getProduit(id);
            req.setAttribute("produit",p);
            req.getRequestDispatcher("EditProduit.jsp").forward(req,resp);

        }
        else if (path.equals("/UpdateProduit.php") && req.getMethod().equals("POST")){
            Long id=Long.parseLong(req.getParameter("id"));
            String des=req.getParameter("designation");
            double prix=Double.parseDouble(req.getParameter("prix"));
            int quantite=Integer.parseInt(req.getParameter("quantite"));
            Produit p=new Produit(des,prix,quantite);
            p.setId(id);
            metier.update(p);
            req.setAttribute("produit",p);
            req.getRequestDispatcher("Confirmation.jsp").forward(req,resp);
        }
        else {
            resp.sendError(resp.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
