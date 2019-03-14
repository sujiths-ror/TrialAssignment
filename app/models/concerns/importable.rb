require 'csv'
# require 'active_record'
require 'activerecord-import'

module Importable
  extend ActiveSupport::Concern

  def csv_import file
    @roles = Role.pluck(:name, :id).to_h
    @mappings = Mapping.pluck(:name, :id).to_h
    items = []
    CSV.foreach(file.path, headers: true) do |row|
      role_id = find_or_create_role_from_csv(row)
      mapping_id = find_or_create_mapping_from_csv(row)
      question_json = build_question_json(row, mapping_id, role_id)
      items << question_json if question_json
    end
    Question.import(items)
  end

  private
  def attributes_mapping
    {
      priority: 'Pri',
      question: 'Question',
      teaming_stages: 'Teaming Stages',
      appears: 'Appears (Day)',
      frequency: 'Frequency',
      question_type: 'Type',
      role_id: 'Role',
      required: 'Required?',
      conditions: 'Conditions',
      mapping_id: 'Mapping'
    }
  end

  def build_question_json row, mapping_id, role_id
    if mapping_id.present? && role_id.present? && row[attributes_mapping[:question]].present?
      {
        priority: row[attributes_mapping[:priority]],
        question: row[attributes_mapping[:question]],
        teaming_stages: row[attributes_mapping[:teaming_stages]].downcase,
        appears: row[attributes_mapping[:appears]],
        frequency: row[attributes_mapping[:frequency]],
        question_type: row[attributes_mapping[:question_type]],
        role_id: role_id,
        required: row[attributes_mapping[:required]],
        conditions: row[attributes_mapping[:conditions]].downcase,
        mapping_id: mapping_id
      }
    else
      #TODO handle invalid data
      false
    end
  end

  def find_or_create_role_from_csv row
    if role_id = @roles[row[attributes_mapping[:role_id]].downcase]
      role_id
    else
      role = Role.create(name: row[attributes_mapping[:role_id]].downcase)
      @roles[role.name] = role.id
      role.id
    end
  end

  def find_or_create_mapping_from_csv row
    if mapping_id = @mappings[row[attributes_mapping[:mapping_id]].downcase]
      mapping_id
    else
      mapping = Mapping.create(name: row[attributes_mapping[:mapping_id]].downcase)
      @mappings[mapping.name] = mapping.id
      mapping.id
    end
  end
end


