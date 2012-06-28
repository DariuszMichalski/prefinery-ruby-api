module Prefinery
  module ViewHelper
    def prefinery_invitation_javascript(options = {})
      options.symbolize_keys!
      <<-HTML
      <script type="text/javascript">
        var prefineryJsHost = 'http://www.prefinery.com/';
        document.write(unescape("%3Cscript src='" + prefineryJsHost + "javascripts/widget.js' type='text/javascript'%3E%3C/script%3E"))
      </script>
      <script type='text/javascript' charset='utf-8'>
        var prefinery_apply_options = {
          account: "#{options[:subdomain]}",
          beta_id: "#{options[:beta_id]}",
          link_id: "prefinery_apply_link"
        };
        Prefinery.apply(prefinery_apply_options);
      </script>
      HTML
    end

    def prefinery_embed_invitation_form(options = {})
      options.symbolize_keys!
      <<-HTML
      <iframe id='prefinery_iframe_inline' allowTransparency='true' width='100%' height='600' scrolling='no' frameborder='0' src="#{Prefinery.url}/betas/#{options[:beta_id]}/testers/new?display=inline"></iframe>
      HTML
    end
    
    def link_to_prefinery_invitation(name, options = {}, html_options = {})
      html_options.merge!({:id => 'prefinery_invite_link'})
      link_to name, options, html_options
    end
  end
end
