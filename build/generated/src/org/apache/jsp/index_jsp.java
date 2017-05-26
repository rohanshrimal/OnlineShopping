package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.Cookie;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');

    Cookie ck[]=request.getCookies();
    
    String id="";
    String pwd="";
    
    if(ck!=null)
    {
        for(int i=0;i<ck.length;i++)
        {
            String name=ck[i].getName();
            if(name.equals("id"))
                 id=ck[i].getValue();
            
            else if(name.equals("pwd"))
                 pwd=ck[i].getValue();
    
        }
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>ONLINE SHOPPING</title>\n");
      out.write("       \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       <PRE> <H1> O N L I N E     S H O P P I N G </H1></PRE>\n");
      out.write("        <FORM ACTION = \"verifyuser\" method=\"post\">\n");
      out.write("            <pre>\n");
      out.write("           <HR>\n");
      out.write("            LOGIN-ID    <INPUT TYPE=\"TEXT\" NAME=\"id\" value=\"");
      out.print(id);
      out.write("\"/>\n");
      out.write("            PASSWORD    <INPUT TYPE=\"password\" NAME=\"pwd\" value=\"");
      out.print(pwd);
      out.write("\"/>\n");
      out.write("            USER-TYPE   <select name=\"utype\">\n");
      out.write("                        <option>BUYER</option>\n");
      out.write("                        <option>ADMIN</option>\n");
      out.write("                        </select>\n");
      out.write("            \n");
      out.write("            SAVE PASSWORD<INPUT TYPE =\"checkbox\" name=\"sp\"/>\n");
      out.write("            \n");
      out.write("                        <input type=\"submit\" value=\"LOG IN\"/>\n");
      out.write("                        <HR>\n");
      out.write("\n");
      out.write("            <A href=\"registration.jsp\">SIGN UP</A>\n");
      out.write("            </pre>\n");
      out.write("            \n");
      out.write("        </FORM>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
