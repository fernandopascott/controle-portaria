package br.com.controle.portaria.controller;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

//@EnableOpenApi
@Configuration
@EnableSwagger2 
public class SpringFoxConfig extends WebMvcConfigurationSupport {

	@Bean
	public Docket apiDocket() {
		return new Docket(DocumentationType.SWAGGER_2)
				.select()
				.apis(RequestHandlerSelectors.basePackage("br.com.controle.portaria.controller.webservice"))
				.paths(PathSelectors.any())
				.build()
				.apiInfo(metaInfo())
				.genericModelSubstitutes(ResponseEntity.class)
		        .forCodeGeneration(true);
	}

	private ApiInfo metaInfo() {

		ApiInfo apiInfo = new ApiInfo("Tech Dev Pascott", "WebService de Controle de Portaria.", "1.0", "Terms of Service",
				new Contact("Fernando Pascott", "https://www.youtube.com/@tech_pascott",""),
				"Apache License Version 2.0", "https://www.apache.org/license.html", new ArrayList<>());
		return apiInfo;
	}
	
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/webjars/");
//		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/springfox-swagger-ui/");
//	}
//	
}
