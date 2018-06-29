/**
 * Chat logic
 *
 * Most of the js functionality is inspired from anatgarg.com
 * jQuery tag Module from the tutorial
 * http://anantgarg.com/2009/05/13/gmail-facebook-style-jquery-chat/
 *
 */


var chatboxFocus = new Array();
var chatBoxes = new Array();

var ready = function(){


    chatBox = {

        /**
         * creates an inline chatbox on the page by calling the
         * createChatBox function passing along the unique instaconvo_id
         *
         * @param instaconvo_id
         */

        chatWith: function (instaconvo_id) {

            chatBox.createChatBox(instaconvo_id);
            $("#chatbox_" + instaconvo_id + " .chatboxtextarea").focus();
        },

        /**
         * closes the chatbox by essentially hiding it from the page
         *
         * @param instaconvo_id
         */

        close: function (instaconvo_id) {
            $('#chatbox_' + instaconvo_id).css('display', 'none');
            chatBox.restructure();
        },

        /**
         * Plays a notification sound when a new chat supamessage arrives
         */

        notify: function () {
            var audioplayer = $('#chatAudio')[0];
            audioplayer.play();
        },

        /**
         * Handles 'smart layouts' of the chatboxes. Like when new chatboxes are
         * added or removed from the view, it restructures them so that they appear
         * neatly aligned on the page
         */

        restructure: function () {
            align = 0;
            for (x in chatBoxes) {
                chatbox_id = chatBoxes[x];

                if ($("#chatbox_" + chatbox_id).css('display') != 'none') {
                    if (align == 0) {
                        $("#chatbox_" + chatbox_id).css('right', '20px');
                    } else {
                        width = (align) * (280 + 7) + 20;
                        $("#chatbox_" + chatbox_id).css('right', width + 'px');
                    }
                    align++;
                }
            }

        },

        /**
         * Takes in two parameters. It is responsible for fetching the specific instaconvo's
         * html page and appending it to the body of our home page e.g if instaconvo_id = 1
         *
         * $.get("instaconvos/1, function(data){
         *    // rest of the logic here
         * }, "html")
         *
         * @param instaconvo_id
         * @param minimizeChatBox
         */

        createChatBox: function (instaconvo_id, minimizeChatBox) {
            if ($("#chatbox_" + instaconvo_id).length > 0) {
                if ($("#chatbox_" + instaconvo_id).css('display') == 'none') {
                    $("#chatbox_" + instaconvo_id).css('display', 'block');
                    chatBox.restructure();
                }
                $("#chatbox_" + instaconvo_id + " .chatboxtextarea").focus();
                return;
            }

            $("body").append('<div id="chatbox_' + instaconvo_id + '" class="chatbox"></div>')

            $.get("/instaconvos/" + instaconvo_id, function (data) {
                $('#chatbox_' + instaconvo_id).html(data);
                $("#chatbox_" + instaconvo_id + " .chatboxcontent").scrollTop($("#chatbox_" + instaconvo_id + " .chatboxcontent")[0].scrollHeight);
            }, "html");

            $("#chatbox_" + instaconvo_id).css('bottom', '0px');

            chatBoxeslength = 0;

            for (x in chatBoxes) {
                if ($("#chatbox_" + chatBoxes[x]).css('display') != 'none') {
                    chatBoxeslength++;
                }
            }

            if (chatBoxeslength == 0) {
                $("#chatbox_" + instaconvo_id).css('right', '20px');
            } else {
                width = (chatBoxeslength) * (280 + 7) + 20;
                $("#chatbox_" + instaconvo_id).css('right', width + 'px');
            }

            chatBoxes.push(instaconvo_id);

            if (minimizeChatBox == 1) {
                minimizedChatBoxes = new Array();

                if ($.cookie('chatbox_minimized')) {
                    minimizedChatBoxes = $.cookie('chatbox_minimized').split(/\|/);
                }
                minimize = 0;
                for (j = 0; j < minimizedChatBoxes.length; j++) {
                    if (minimizedChatBoxes[j] == instaconvo_id) {
                        minimize = 1;
                    }
                }

                if (minimize == 1) {
                    $('#chatbox_' + instaconvo_id + ' .chatboxcontent').css('display', 'none');
                    $('#chatbox_' + instaconvo_id + ' .chatboxinput').css('display', 'none');
                }
            }

            chatboxFocus[instaconvo_id] = false;

            $("#chatbox_" + instaconvo_id + " .chatboxtextarea").blur(function () {
                chatboxFocus[instaconvo_id] = false;
                $("#chatbox_" + instaconvo_id + " .chatboxtextarea").removeClass('chatboxtextareaselected');
            }).focus(function () {
                chatboxFocus[instaconvo_id] = true;
                $('#chatbox_' + instaconvo_id + ' .chatboxhead').removeClass('chatboxblink');
                $("#chatbox_" + instaconvo_id + " .chatboxtextarea").addClass('chatboxtextareaselected');
            });

            $("#chatbox_" + instaconvo_id).click(function () {
                if ($('#chatbox_' + instaconvo_id + ' .chatboxcontent').css('display') != 'none') {
                    $("#chatbox_" + instaconvo_id + " .chatboxtextarea").focus();
                }
            });

            $("#chatbox_" + instaconvo_id).show();

        },

        /**
         * Responsible for listening to the keypresses when chatting. If the Enter button is pressed,
         * we submit our instaconvo form to our rails app
         *
         * @param event
         * @param chatboxtextarea
         * @param instaconvo_id
         */

        checkInputKey: function (event, chatboxtextarea, instaconvo_id) {
            if (event.keyCode == 13 && event.shiftKey == 0) {
                event.preventDefault();

                supamessage = chatboxtextarea.val();
                supamessage = supamessage.replace(/^\s+|\s+$/g, "");

                if (supamessage != '') {
                    $('#instaconvo_form_' + instaconvo_id).submit();
                    $(chatboxtextarea).val('');
                    $(chatboxtextarea).focus();
                    $(chatboxtextarea).css('height', '44px');
                }
            }

            var adjustedHeight = chatboxtextarea.clientHeight;
            var maxHeight = 94;

            if (maxHeight > adjustedHeight) {
                adjustedHeight = Math.max(chatboxtextarea.scrollHeight, adjustedHeight);
                if (maxHeight)
                    adjustedHeight = Math.min(maxHeight, adjustedHeight);
                if (adjustedHeight > chatboxtextarea.clientHeight)
                    $(chatboxtextarea).css('height', adjustedHeight + 8 + 'px');
            } else {
                $(chatboxtextarea).css('overflow', 'auto');
            }

        },

        /**
         * Responsible for handling minimize and maximize of the chatbox
         *
         * @param instaconvo_id
         */

        toggleChatBoxGrowth: function (instaconvo_id) {
            if ($('#chatbox_' + instaconvo_id + ' .chatboxcontent').css('display') == 'none') {

                var minimizedChatBoxes = new Array();

                if ($.cookie('chatbox_minimized')) {
                    minimizedChatBoxes = $.cookie('chatbox_minimized').split(/\|/);
                }

                var newCookie = '';

                for (i = 0; i < minimizedChatBoxes.length; i++) {
                    if (minimizedChatBoxes[i] != instaconvo_id) {
                        newCookie += instaconvo_id + '|';
                    }
                }

                newCookie = newCookie.slice(0, -1)


                $.cookie('chatbox_minimized', newCookie);
                $('#chatbox_' + instaconvo_id + ' .chatboxcontent').css('display', 'block');
                $('#chatbox_' + instaconvo_id + ' .chatboxinput').css('display', 'block');
                $("#chatbox_" + instaconvo_id + " .chatboxcontent").scrollTop($("#chatbox_" + instaconvo_id + " .chatboxcontent")[0].scrollHeight);
            } else {

                var newCookie = instaconvo_id;

                if ($.cookie('chatbox_minimized')) {
                    newCookie += '|' + $.cookie('chatbox_minimized');
                }


                $.cookie('chatbox_minimized', newCookie);
                $('#chatbox_' + instaconvo_id + ' .chatboxcontent').css('display', 'none');
                $('#chatbox_' + instaconvo_id + ' .chatboxinput').css('display', 'none');
            }

        }



    }


    /**
     * Cookie plugin
     *
     * Copyright (c) 2006 Klaus Hartl (stilbuero.de)
     * Dual licensed under the MIT and GPL licenses:
     * http://www.opensource.org/licenses/mit-license.php
     * http://www.gnu.org/licenses/gpl.html
     *
     */

    jQuery.cookie = function (name, value, options) {
        if (typeof value != 'undefined') { // name and value given, set cookie
            options = options || {};
            if (value === null) {
                value = '';
                options.expires = -1;
            }
            var expires = '';
            if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
                var date;
                if (typeof options.expires == 'number') {
                    date = new Date();
                    date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
                } else {
                    date = options.expires;
                }
                expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
            }
            // CAUTION: Needed to parenthesize options.path and options.domain
            // in the following expressions, otherwise they evaluate to undefined
            // in the packed version for some reason...
            var path = options.path ? '; path=' + (options.path) : '';
            var domain = options.domain ? '; domain=' + (options.domain) : '';
            var secure = options.secure ? '; secure' : '';
            document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
        } else { // only name given, get cookie
            var cookieValue = null;
            if (document.cookie && document.cookie != '') {
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = jQuery.trim(cookies[i]);
                    // Does this cookie string begin with the name we want?
                    if (cookie.substring(0, name.length + 1) == (name + '=')) {
                        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                        break;
                    }
                }
            }
            return cookieValue;
        }
    };


}

$(document).ready(ready);
$(document).on("page:load", ready);
