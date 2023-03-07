package com.example.listcustomer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerListServlet", value = "/customer-list")
public class CustomerListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Van Hoan", LocalDate.of(1983, 10, 20), "Ha Noi", "https://vapa.vn/wp-content/uploads/2022/12/anh-dai-dien-dep-001.jpg"));
        customerList.add(new Customer("Nguyen Van Nam", LocalDate.of(1983, 10, 21), "Bac Giang", "https://i.pinimg.com/236x/12/37/b3/1237b30268db9ee0c9cbe3a79b1ff8fa.jpg"));
        customerList.add(new Customer("Nguyen Thai Hoa", LocalDate.of(1983, 10, 17), "Nam Dinh", "https://top10dienbien.com/wp-content/uploads/2022/10/avatar-cute-36.jpg"));
        customerList.add(new Customer("Tran Dang Khoa", LocalDate.of(1983, 10, 18), "Ha Tay", "https://i.pinimg.com/originals/53/9a/bf/539abf41ecac6c0c4ddba6853caf45c9.jpg"));
        customerList.add(new Customer("Nguyen Dinh Thi", LocalDate.of(1983, 10, 19), "Ha Noi", "https://i.pinimg.com/474x/ba/2a/3b/ba2a3b32853a6a7ec329260328c7eea6.jpg"));
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-customer.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
