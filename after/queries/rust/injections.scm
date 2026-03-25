;; extends

; SQL injection for rusqlite Connection::execute calls
((call_expression
  function: (field_expression
    field: (field_identifier) @_method)
  arguments: (arguments
    (string_literal
      (string_content) @injection.content)))
  (#any-of? @_method "execute" "prepare")
  (#set! injection.language "sql")

  )
