class CreateCustomReportSeries < ActiveRecord::Migration
  def self.up
    unless table_exists? :custom_report_series
      create_table :custom_report_series do |t|
        t.column :custom_report_id, :integer
        t.column :name, :string
        t.column :filters, :text

        t.timestamps
      end
      add_index :custom_report_series, :custom_report_id
    end
  end

  def self.down
    if table_exists?
      remove_index :custom_report_series, :custom_report_id
      drop_table :custom_report_series
    end
  end
end
