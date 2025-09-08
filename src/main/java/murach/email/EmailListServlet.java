package murach.email;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import murach.business.User;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || "join".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                @SuppressWarnings("unchecked")
                ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    User last = users.get(users.size() - 1);
                    request.setAttribute("user", last);
                }
            }
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            doPost(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "add";
        }

        if ("add".equals(action)) {
            String firstName = request.getParameter("firstName");
            String lastName  = request.getParameter("lastName");
            String email     = request.getParameter("email");

            User user = new User(firstName, lastName, email);

            request.setAttribute("user", user);

            request.setAttribute("currentDate", new Date());

            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
            ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
            if (users == null) {
                users = new ArrayList<>();
            }
            users.add(user);
            session.setAttribute("users", users);
            request.getRequestDispatcher("/thanks.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}

