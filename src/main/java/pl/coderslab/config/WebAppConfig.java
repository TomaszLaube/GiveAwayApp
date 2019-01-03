package pl.coderslab.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import pl.coderslab.converters.GoodsConverter;
import pl.coderslab.converters.ReceiverConverter;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "pl.coderslab")
public class WebAppConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addFormatters(FormatterRegistry registry){
        registry.addConverter(getGoodsConverter());
        registry.addConverter(getReceiverConverter());
    }

    @Bean
    public GoodsConverter getGoodsConverter(){
        return new GoodsConverter();
    }

    @Bean
    public ReceiverConverter getReceiverConverter(){
        return new ReceiverConverter();
    }


    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public	void addViewControllers(ViewControllerRegistry registry)	{
        registry.addViewController("/login").setViewName("home/login");
        registry.addViewController("/403").setViewName("home/403");
        registry.addViewController("/loginFailed").setViewName("home/loginFailed");
    }
    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }
}
