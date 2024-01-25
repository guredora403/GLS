class GeneratedContent < ApplicationRecord
  belongs_to :prompt, class_name: "Prompt", foreign_key: "prompt_id"
end
