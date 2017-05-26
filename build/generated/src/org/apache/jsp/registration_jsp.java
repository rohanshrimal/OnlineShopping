package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registration_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("         <title>WELCOME TO ONLINE SHOPPING</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <PRE><h1>R E G I S T R A T I O N</h1></PRE>\n");
      out.write("        <FORM action=\"saveuser\" method=\"post\">\n");
      out.write("            <pre>\n");
      out.write("            <hr>\n");
      out.write("            LOGIN-ID    <INPUT TYPE=\"TEXT\" name=\"id\"/>\n");
      out.write("            PASSWORD    <INPUT TYPE=\"PASSWORD\" name=\"pwd\"/>\n");
      out.write("            NAME        <INPUT TYPE=\"TEXT\" name=\"name\"/>\n");
      out.write("            ADDRESS     <INPUT TYPE=\"TEXT\" name=\"add\"/>\n");
      out.write("            MOBILE      <INPUT TYPE=\"TEXT\" name=\"mobile\"/>\n");
      out.write("\n");
      out.write("                      <INPUT TYPE=\"SUBMIT\" value=\"REGISTER\"/>\n");
      out.write("            <hr>\n");
      out.write("            <A HREF=\"index.html\">HOME</A>\n");
      out.write("            </pre>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
