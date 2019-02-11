let g:rails_projections = {
	      \ "app/models/*.rb": {
	      \   "command": "model",
	      \   "template":
	      \     ["# frozen_string_literal: true", "",
        \      "class {camelcase|capitalize} < "
	      \      . "ApplicationRecord", "end"]
	      \ },
	      \ "app/forms/*_form.rb": {
	      \   "command": "form",
	      \   "template":
	      \     ["# frozen_string_literal: true", "",
        \      "class {camelcase|capitalize}Form" , "end"],
	      \   "rubyMacro": ["validates"]
	      \ },
        \ "spec/controllers/*_spec.rb": {
        \   "template": [
        \     "# frozen_string_literal: true",
        \     "require 'rails_helper'",
        \     "",
        \     "describe {camelcase|capitalize|colons} do",
        \     "end"
        \   ],
        \   "type": "functional test",
        \   "rubyMacro": ["be_falsy", "be_truthy", "eq", "create", "be_ok", "be_nil", "raise_error"]
        \ },
        \ "spec/requests/*.rb": {
	      \   "rubyMacro": ["be_falsy", "be_truthy", "eq", "create", "be_ok", "be_nil", "raise_error"]
        \ }}
