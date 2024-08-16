package com.example.webbansach_backend.config;

import com.example.webbansach_backend.entities.NguoiDung;
import com.example.webbansach_backend.entities.TheLoai;
import jakarta.persistence.EntityManager;
import jakarta.persistence.metamodel.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@Configuration
public class MethodRestConfig implements RepositoryRestConfigurer {
    private String URL = "http://localhost:3000";
    @Autowired
    private EntityManager entityManager;

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {
        HttpMethod[] chanMethods = {
                HttpMethod.POST,
                HttpMethod.PUT,
                HttpMethod.DELETE,
                HttpMethod.PATCH
        };
        HttpMethod[] MethodDelete = { HttpMethod.DELETE };

        //expostId
        //Cho phet id trong JSON
        config.exposeIdsFor(entityManager.getMetamodel().getEntities().stream().map(Type::getJavaType).toArray(Class[]::new));
//        config.exposeIdsFor(TheLoai.class);

            //CORS
        cors.addMapping("/**").allowedOrigins(URL).allowedMethods("GET", "POST", "PUT", "DELETE");

//        disableHttpMethod(TheLoai.class,config,chanMethods);
//        disableHttpMethod(NguoiDung.class,config, MethodDelete);
    }

    private void disableHttpMethod(Class c,
                                   RepositoryRestConfiguration config,
                                   HttpMethod[] method) {
        config.getExposureConfiguration().forDomainType(c)
                .withItemExposure((metdata, httpMethods) -> httpMethods.disable(method))
                .withCollectionExposure((metdata, httpMethods) -> httpMethods.disable(method));
    }
}
