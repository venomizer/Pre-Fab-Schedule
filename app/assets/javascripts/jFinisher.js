/**
 * Created by JetBrains RubyMine.
 * User: JGalindo
 * Date: 2/29/12
 * Time: 2:45 PM
 * To change this template use File | Settings | File Templates.
 */
(function($){
    $.fn.jFinisher = function(){
        var element = this;

        $(element).find('button.button').click(function(){
            $(element).fade();

        });

    };
})(jQuery);