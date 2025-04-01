datagroup: gcs_storage_object_attributes_datagroup {
  sql_trigger:
    WITH st_total AS (
      SELECT
        DATE(manifest.snapshotTime) AS snapshotTime,
        COUNT(*) AS total
      FROM
        `@{project_id}.@{bigquery_dataset}.events_view`
      WHERE
        manifest.viewName = 'object_attributes_view' AND
        manifest.snapshotTime = (
          SELECT MAX(manifest.snapshotTime)
          FROM `@{project_id}.@{bigquery_dataset}.events_view`
        )
      GROUP BY 1)
    SELECT CONCAT(CAST(snapshotTime AS STRING), ' | ', CAST(total AS STRING)) AS combined_value
    FROM st_total;;
  max_cache_age: "1 hour"
}
