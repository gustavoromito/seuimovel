package Filter;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by antonio on 09/10/16.
 */
@WebFilter(servletNames={"Faces Servlet"})
public class JPAFilter implements Filter{
    private EntityManagerFactory factory;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.factory = Persistence.createEntityManagerFactory("PersistenceUnit");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        EntityManager manager = this.factory.createEntityManager();
        servletRequest.setAttribute("EntityManager", manager);
        manager.getTransaction().begin();

        filterChain.doFilter(servletRequest, servletResponse);

        try {
            manager.getTransaction().commit();
        }
        catch (Exception e) {
            manager.getTransaction().rollback();
        }
        finally {
            manager.close();
        }
    }

    @Override
    public void destroy() {
        this.factory.close();
    }
}
