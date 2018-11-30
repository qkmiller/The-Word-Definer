def filter(string)
  profanity = LanguageFilter::Filter.new(matchlist: :profanity, exceptionlist: [], replacement: :stars)
  sex = LanguageFilter::Filter.new(matchlist: :sex, exceptionlist: [], replacement: :stars)
  violence = LanguageFilter::Filter.new(matchlist: :violence, exceptionlist: [], replacement: :stars)
  if profanity.match?(string) || sex.match?(string) || violence.match?(string)
    true
  else
    false
  end
end
