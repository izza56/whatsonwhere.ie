# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Added this so we can easily convert numbers to currency format for HTML - Jack
  # it works inside blocks such as div or td - see h_euro_i for inline
  def h_euro_b(number)
    "<div class=currencySymbolBlock>" + h("€") + "</div>" +
    "<div class=currencyValueBlock>" + currencify(number, {:currency_symbol => ""}) + "</div>"
  end

  def h_euro_i(number)
    "<span class=nowrap><span class=currencySymbol>" + h("€") + "</span>" +
    "<span class=currencyValue>" + currencify(number, {:currency_symbol => ""}) + "</span></span>"
  end

  # I got this from: http://codesnippets.joyent.com/posts/show/1812 - Jack
  # takes a number and options hash and outputs a string in any currency format
  def currencify(number, options={})
    # :currency_before => false puts the currency symbol after the number
    # default format: $12,345,678.90
    options = {:currency_symbol => "$", :delimiter => ",", :decimal_symbol => ".", :currency_before => true}.merge(options)

    # split integer and fractional parts 
    int, frac = ("%.2f" % number).split('.')
    # insert the delimiters
    int.gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{options[:delimiter]}")

    if options[:currency_before]
      options[:currency_symbol] + int + options[:decimal_symbol] + frac
    else
      int + options[:decimal_symbol] + frac + options[:currency_symbol]
    end
  end

end
