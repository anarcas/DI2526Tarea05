<?xml version='1.0' encoding='UTF-8' ?> 
<?xml version='1.0' encoding='UTF-8' ?> 
<!DOCTYPE helpset
PUBLIC
"-//Sun Microsystems Inc.//DTD JavaHelp HelpSet Version 2.0//EN"
"http://java.sun.com/products/javahelp/helpset_2_0.dtd">

<helpset version="2.0">
    
    <!−− title −−>
    <title>JavaHelp System Guia de usuario</title>
    
    <maps>
        <homeID>ayuda_general</homeID>
        <mapref location="map.jhm" />
    </maps>
    
    <!−− views −−>
    
    <!−− Tabla de contenidos −−>
    <view>
        <name>TOC</name>
        <label>Tabla de contenidos</label>
        <type>javax.help.TOCView</type>
        <data>toc.xml</data>
    </view>
    
    <!−− Indice −−>
    <view>
        <name>Indice</name>
        <label>Indice</label>
        <type>javax.help.IndexView</type>
        <data>indice.xml</data>
    </view>
    
    <!−− Busqueda −−>
    <view>
        <name>Busqueda</name>
        <label>Buscar</label>
        <type>javax.help.SearchView</type>
        <data engine="com.sun.java.help.search.DefaultSearchEngine">
            JavaHelpSearch
        </data>
    </view>
    
</helpset>