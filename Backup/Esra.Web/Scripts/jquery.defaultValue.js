/*
* Default Value 1.0.1
*
* Copyright (c) 2009 Lesnykh IV
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*
* Dual licensed under the MIT and GPL licenses.
*
* @copyright	2009 Лесных Илья Владимирович
* @license		http://www.gnu.org/licenses/gpl.html	GNU GPL
* @license		http://www.opensource.org/licenses/mit-license.php	MIT
* @version		Release: $Id: jquery.defaultValue.js, v 1.0.1 2009-06-11 Lesnykh IV $
* @contact		leonclan@yandex.ru
* @author		Lesnykh IV
* @since		Script available since jQuery 1.3.2
*/
(function ($) {
    $.fn.defaultValue = function (options) {
        var options = $.extend(
				{
				    defVal: 'Search'
				},
				options
			);
        return this.each(function () {
            $(this).blur(function () {
                if ($(this).val() === '')
                    $(this).val(options.defVal);
            }
					).focus(function () {
					    if ($(this).val() === options.defVal)
					        $(this).val('');
					}
					);
        }
			);
    }
}
)(jQuery);