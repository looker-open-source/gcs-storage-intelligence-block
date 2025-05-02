# <span style="color:blue"> Google Cloud Storage - Storage Intelligence - Looker Dashboard </span>

<div style="text-align: justify; line-height: 1.5;">
<p> This Google <b> Cloud Storage - Storage Intelligence </b> LookML code is currently under active development and is subject to modification based on evolving customer requirements. </p>

<p> Users should be aware that this dashboard may require substantial BigQuery resources, potentially leading to increased costs.</p>

<p>This dashboard is exclusively compatible with the Storage Intelligence linked dataset residing within your BigQuery environment. Utilizing this dashboard with any alternative database or data warehouse is not supported and will result in query errors.</p>

<p>This dashboard utilizes two Persistent Derived Tables (PDTs). For proper functionality, it is essential that your Looker connection is configured to enable PDT functionality.</p>

<p>In case you need some help with the connection, plase refer to this Looker Documentation: <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery" target="_blank">BigQuery</a></p>

For questions/issues and feedback, reach out to <b><i>insights-customer-support@google.com</i></b>.

</div>

## Key considerations

<div style="text-align: justify; line-height: 1.5;">

<ol>
    <li>We are excited for customers to use the atasets Google Cloud Storage is providing. To start the setup process, we recommend reviewing the introductory statement on <a href="https://cloud.google.com/storage/docs/storage-intelligence/overview" target="_blank">Storage Intelligence</a>. Following this, please consult the guidelines for activating your GCS datasets within your GCP environment, detailed under <a href="https://cloud.google.com/storage/docs/storage-intelligence/configure-and-manage-storage-intelligence" target="_blank">Configure and manage Storage Intelligence</a>.</li>
    <li>If you are experiencing any issues related to permissions configuration and timeliness of reports availability. The team is available at <i>insights-customer-support@google.com</i> to help troubleshoot and address any concerns.</li>
    <li>Enabling these Datasets for your production environment (GCP Projects) will not have any operational impact on the GCS Bucket storage/serving workloads. However you will be applying new permissions to production resources so please plan accordingly.</li>
    <li>Datasets generated can be configured to capture data from different GCP Regions and consolidate into a single Linked Dataset in BigQuery. Please take that into consideration if your metadata has regional/sovereignty requirements. Configuring one Dataset per sovereign region is one option available to help address these requirements.</li>
</ol>

</div>

# Google Cloud Storage Intelligence
## What does this Looker Block do for me?

<div style="text-align: justify; line-height: 1.5;">

<p>Designed for Google Cloud Storage (GCS) users, this Looker block facilitates obtaining deep analytical insights from extensive datasets by seamlessly integrating Storage Intelligence data into Looker. It supports the identification of key usage patterns, potential inefficiencies, and opportunities for optimization and cost management, enabling advanced data analysis.</p>

<p>In order to obtain these high level dashboards this block creates:</p>

<ul>
    <li>Two <a href="https://cloud.google.com/looker/docs/derived-tables#creating_pdts" target="_blank">Persistent derived tables</a> - <i>Object Attributes</i> and <i>Bucket Attributes</i> to filter the Snapshot Time. The PDT's are created inside your defined looker_scratch_schema, and are regenerated once the table <b><i>Events view</i></b> inside BigQuery has a different row count.</li>
    <li>One derived table that will be joined to all the available views. This derived table contains the <a href="https://cloud.google.com/about/locations" target="_blank">GCP regions information</a>. This table helps us understand geolocation based on GCP regions and country positions.</li>
    <li>Different parameters to determine the row - columns format. </li>
</ul>

<p> To successfully integrate GCS Storage Intelligence data into BigQuery, please refer to the detailed instructions provided in the <a href="https://cloud.google.com/storage/docs/storage-intelligence/configure-and-manage-storage-intelligence" target="_blank">Configure and manage Storage Intelligence</a> guide.</p>

</div>

# GCS Storage Intelligence Data Structure

<div style="text-align: justify; line-height: 1.5;">

The tables are currently divided into five different options:

<ul>
    <li> bucket_attributes_view </li>
    <li> error_attributes_view </li>
    <li> events_view </li>
    <li> object_attributes_view </li>
    <li> project_attributes_view </li>

</ul>

</div>


# Bucket Attributes

<div style="text-align: justify; line-height: 1.5;">

This view provides metadata regarding the available buckets across your projects or organization.

<br>

This table has the following columns:

<br>

<ul>
    <li> <b>snapshotTime</b>: The snapshot time of the object metadata in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a>. </li>
    <li> <b>name</b>: The name of the source bucket.</li>
    <li>location: Object data for objects in the bucket resides in physical storage within this region or multi-region. Defaults to "US". See <a href="https://cloud.google.com/storage/docs/locations" target="_blank">Cloud Storage bucket locations</a> for the authoritative list. </li>
    <li> <b>project</b>: The project number of the project the bucket belongs to. </li>
    <li> <b>storageClass</b>: The bucket's default storage class, used whenever no storageClass is specified for a newly-created object. If storageClass is not specified when the bucket is created, it defaults to <i>"STANDARD"</i>. For available storage classes, see <a href="https://cloud.google.com/storage/docs/storage-classes" target="_blank">Storage classes</a>. </li>
    <li> <b>versioning</b>:The bucket's versioning configuration. For more information, see <a href="https://cloud.google.com/storage/docs/object-versioning" target="_blank">Object Versioning</a>. </li>
    <li> <b>lifecycle</b>: The bucket's lifecycle configuration status. See <a href="https://cloud.google.com/storage/docs/lifecycle" target="_blank"> lifecycle management </a> for more information. </li>
    <li> <b>metageneration</b>: The metadata generation of this bucket. </li>
    <li> <b>timeCreated</b>: The creation time of the bucket in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li> <b>public</b>: The bucket's IAM configuration.
    <ul>
        <li> <b>public.bucketPolicyOnly</b> </li>
        <li> <b>public.publicAccessPrevention</b>: The bucket's <a href="https://cloud.google.com/storage/docs/public-access-prevention" target="_blank"> public access prevention status </a>, which is either "inherited" or "enforced". If "inherited", the bucket uses public access prevention only if the bucket is subject to the <a href="https://cloud.google.com/storage/docs/org-policy-constraints#public-access-prevention" target="_blank"> public access prevention organization policy constraint</a>. Defaults to "inherited".</li>
    </ul>
    </li>
    <li> <b>autoclass</b>: The bucket's <a href="https://cloud.google.com/storage/docs/autoclass" target="_blank">Autoclass configuration</a>, which, when enabled, controls the storage class of objects based on how and when the objects are accessed.
    <ul>
        <li> <b>autoclass.enabled</b>: Whether or not Autoclass is enabled. By default, this boolean is not set, and Autoclass is disabled.</li>
        <li> <b>autoclass.toggleTime</b>: The time at which Autoclass was last enabled or disabled for this bucket, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    </ul>
    </li>
    <li> <b>softDeletePolicy</b>: The bucket’s soft delete policy, which defines the period of time that soft-deleted objects will be retained, and cannot be permanently deleted.
    <ul>
        <li> <b>softDeletePolicy.effectiveTime</b>: The time from which the policy, or one with a greater retention duration, was effective. This value is in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format. <br> Note that the bucket metadata is cached for 10 seconds. This means that for 10 seconds after the effective time, soft-deleted objects may be subject to the old soft delete policy or the new soft delete policy. </li>
        <li> <b>softDeletePolicy.retentionDurationSeconds</b>: The period of time in seconds that soft-deleted objects in the bucket will be retained and cannot be permanently deleted. <br> The value must be greater than or equal to 604,800 seconds (7 days) and less than 7,776,000 seconds (90 days). This value follows the <a href="https://cloud.google.com/storage/docs/bucket-lock#retention-periods" target="_blank">retention period</a> time unit conventions.</li>
    </ul>
    </li>
    <li> <b>tags</b>: Tags are key-value pairs you can apply to your resources for fine-grained access control. See <a href="https://cloud.google.com/storage/docs/tags-and-labels#tags" target="_blank">Bucket Tags</a> for more details.
    <ul>
        <li> <b>tags.lastUpdatedTime</b> </li>
        <li> <b>tags.tagMap</b>
        <ul>
            <li><b>tags.tagMap.key</b></li>
            <li><b>tags.tagMap.value</b></li>
        </ul>
        </li>
    </ul>
    </li>
    <li> <b>labels</b>: User-provided <a href="https://cloud.google.com/storage/docs/tags-and-labels#bucket-labels" target="_blank">bucket labels </a>, in key/value pairs.
    <ul>
        <li> <b>labels.key</b>: An individual label entry key.</li>
        <li> <b>labels.value</b>: An individual label entry value. </li>
    </ul>
    </li>
</ul>
</div>



# Error Attributes

<div style="text-align: justify; line-height: 1.5;">


This view will display the errors related to GCS

<br>

This table has the following columns:

<br>

<ul>
    <li><b>errorCode</b>: The error code associated with this entry. See below for currently supported error codes.</li>
    <li><b>errorSource</b>: The source of the error (currently only CONFIGURATION_PREPROCESSING).</li>
    <li><b>errorTime</b>: The time the error happened.</li>
    <li><b>sourceGcsLocation</b>: The source GCS location of the error. For projects this field is null given they are locationless.</li>
    <li><b>bucketErrorRecord</b>: Record with information needed to debug a bucket error.
        <ul>
            <li><b>bucketErrorRecord.bucketName</b>: The name of the bucket involved in the error.</li>
            <li><b>bucketErrorRecord.serviceAccount</b>: The service account that needs permission to ingest objects from the bucket.</li>
        </ul>
    </li>
    <li><b>projectErrorRecord</b>: Record with information needed to debug a project error.
    <ul>
        <li><b>projectErrorRecord.projectNumber</b>: The number of the project involved in the error.</li>
        <li><b>projectErrorRecord.organizationName</b>: The name of the organization the project must belong to in order to be processed.</li>
    </ul>
    </li>
</ul>
</div>


| Error Code | Error Case                                   | Error Message                                                                                                      | Troubleshooting                                                                                                                                  |
|------------|----------------------------------------------|--------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| 1          |Source project not in organization error      |"Source project *projectErrorRecord.projectNumber not in organization* projectErrorRecord.organizationName."        |"Add source project *projectErrorRecord.projectNumber* to organization *projectErrorRecord.organizationName*."                                    |
| 2          |Bucket authorization error                    |"Permission denied for ingesting objects for bucket *bucketErrorRecord.bucketName*."                                |"Give service account *bucketErrorRecord.serviceAccount* IAM permissions to allow ingestion of objects for bucket *bucketErrorRecord.bucketName*."|
| 3          |Destination project not in organization error |"Destination project *projectErrorRecord.projectNumber* not in organization *projectErrorRecord.organizationName*." |"Add destination project *projectErrorRecord.projectNumber* to organization *projectErrorRecord.organizationName*."                               |
| 4          |Source project not Management Hub entitled    |"Source project *projectErrorRecord.projectNumber* is not Management Hub entitled."                                 |"Configure Management Hub for source project *projectErrorRecord.projectNumber*."                                                                 |
| 5          |Bucket not Management Hub entitled            |"Bucket *bucketErrorRecord.bucketName* is not Management Hub entitled."                                             |"Configure Management Hub for bucket *bucketErrorRecord.bucketName*."                                                                             |



# Events

<div style="text-align: justify; line-height: 1.5;">

This view displays the timestamp at which data became available in the Object Attributes or Bucket Attributes views.
<br>

This table has the following columns:
<br>

<ul>
    <li><b>manifest</b>
    <ul>
        <li><b>location</b>:GCS source location.</li>
        <li><b>snapshotTime</b>: snapshotTime of the manifest row.</li>
        <li><b>viewName</b>:Table category associated with the row. Currently it supports ‘bucket_attributes_view’ and ‘object_attributes_view’.</li>
    </ul>
    </li>
    <li><b>eventTime</b>: Time of completion of the event. The standard currently is the BigQuery job end time (precision to milliseconds level).</li>
    <li><b>eventCode</b>: Unique code given to each type of event.</li>
</ul>

</div>

# Object Attributes

<div style="text-align: justify; line-height: 1.5;">

Inside this view we can see metadata about the available objects inside your projects or organization.
<br>

This table has the following columns:
<br>

<ul>
    <li><b>snapshotTime</b>: The snapshot time of the object metadata in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>bucket</b>: The name of the bucket containing this object.</li>
    <li><b>location</b>: The <a href="https://cloud.google.com/storage/docs/locations" target="_blank"> location</a> of the source bucket.</li>
    <li><b>componentCount</b>: Returned for <a href="https://cloud.google.com/storage/docs/composite-objects" target="_blank">composite</a> objects only. Number of non-composite objects in the composite object. componentCount includes non-composite objects that were part of any composite objects used to compose the current object. Note: Composite objects do not have an MD5 hash metadata field.</li>
    <li><b>contentDisposition</b>: <a href="https://datatracker.ietf.org/doc/html/rfc6266" target="_blank">Content-Disposition</a> of the object data.</li>
    <li><b>contentEncoding</b>: <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-3.1.2.2" target="_blank">Content-Encoding</a> of the object data.</li>
    <li><b>contentLanguage</b>: <a href="https://cloud.google.com/storage/docs/metadata#content-language" target="_blank">Content-Language</a> of the object data.</li>
    <li><b>contentLanguage</b>: <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-3.1.1.5" target="_blank">Content-Type</a> of the object data. If an object is stored without a Content-Type, it is served as application/octet-stream.</li>
    <li><b>crc32c</b>: CRC32c checksum, as described in <a href="https://datatracker.ietf.org/doc/html/rfc4960#appendix-B" target="_blank">RFC 4960</a>, Appendix B; encoded using <a href="https://datatracker.ietf.org/doc/html/rfc4648#section-4" target="_blank">base64</a> in big-endian byte order. For more information about using the CRC32c checksum, see <a href="https://cloud.google.com/storage/docs/data-validation#json-api" target="_blank"> Hashes and eTags: best practices</a>. </li>
    <li><b>customTime</b>: A user-specified timestamp for the object in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format. Once set on an object, customTime cannot be removed and cannot be set to an earlier datetime. For more information, see <a href="https://cloud.google.com/storage/docs/metadata#custom-time" target="_blank">custom time metadata</a>.</li>
    <li><b>etag</b>: HTTP 1.1 <a href="https://datatracker.ietf.org/doc/html/rfc7232#section-2.3" target="_blank">Entity tag</a> for the object.</li>
    <li><b>eventBasedHold</b>: Whether or not the object is subject to an <a href="https://cloud.google.com/storage/docs/object-holds#hold-types" target="_blank">event-based hold</a>.</li>
    <li><b>generation</b>: The content <a href="https://cloud.google.com/storage/docs/metadata#generation-number" target="_blank">generation</a> of this object. Used for object versioning.</li>
    <li><b>md5Hash</b>: MD5 hash of the data, encoded using <a href="https://datatracker.ietf.org/doc/html/rfc4648#section-4" target="_blank">base64</a>. This field is not present for <a href="https://cloud.google.com/storage/docs/composite-objects" target="_blank">composite objects</a>. For more information about using the MD5 hash, see <a href="https://cloud.google.com/storage/docs/data-validation#json-api" target="_blank">Hashes and ETags: Best Practices</a>.</li>
    <li><b>mediaLink</b>: A URL for downloading the object's data. You should generally use one of the other <a href="https://cloud.google.com/storage/docs/request-endpoints#typical" target="_blank">JSON API endpoints</a> instead.</li>
    <li><b>metageneration</b>: The version of the metadata for this object at this generation. Used for preconditions and for detecting changes in metadata. A metageneration number is only meaningful in the context of a particular generation of a particular object.</li>
    <li><b>name</b>: The name of the object. Required if not specified by URL parameter.</li>
    <li><b>selfLink</b>: A URL for this object. You should generally use one of the other <a href="https://cloud.google.com/storage/docs/request-endpoints#typical" target="_blank">JSON API endpoints</a> instead.</li>
    <li><b>size</b>: <a href="https://datatracker.ietf.org/doc/html/rfc7230#section-3.3.2" target="_blank">Content-Length</a> of the data in bytes.</li>
    <li><b>storageClass</b>: <a href="https://cloud.google.com/storage/docs/storage-classes" target="_blank">Storage class</a> of the object. To change an object's storage class, use <a href="https://cloud.google.com/storage/docs/json_api/v1/objects/rewrite" target="_blank">objects rewrite</a>.</li>
    <li><b>temporaryHold</b>: Whether or not the object is subject to a <a href="https://cloud.google.com/storage/docs/object-holds#hold-types" target="_blank">temporary hold</a>.</li>
    <li><b>timeCreated</b>: The creation time of the object in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>timeDeleted</b>: The deletion time of the object in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format. Returned if and only if this version of the object is no longer a live version, but remains in the bucket as a <a href="https://cloud.google.com/storage/docs/object-versioning" target="_blank">noncurrent version</a>.</li>
    <li><b>updated</b>: The <a href="https://cloud.google.com/storage/docs/metadata#modification-time" target="_blank">modification time</a> of the object metadata in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format. Set initially to object creation time and then updated whenever any metadata of the object changes. This includes changes made by a requester, such as modifying custom metadata, as well as changes made by Cloud Storage on behalf of a requester, such as changing the storage class based on an Object Lifecycle Configuration.</li>
    <li><b>timeStorageClassUpdated</b>: The time at which the object's storage class was last changed. When the object is initially created, it will be set to timeCreated.</li>
    <li><b>retentionExpirationTime</b>: The earliest time that the object can be deleted, which depends on any <a href="https://cloud.google.com/storage/docs/object-lock" target="_blank">retention configuration</a> set for the object and any <a href="https://cloud.google.com/storage/docs/bucket-lock#retention-policy" target="_blank">retention policy</a> set for the bucket that contains the object. The value for retentionExpriationTime is given in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>softDeleteTime</b>: If this object has been soft-deleted, this is the time at which it became soft-deleted.</li>
    <li><b>hardDeleteTime</b>: This is the time (in the future) when the object will no longer be restorable. It is equal to the soft delete time plus the soft delete retention duration of the bucket. Note that the hard delete time will not change in response to future changes to the bucket soft delete retention duration. <br> This property is only set for soft-deleted objects.</li>
    <li><b>metadata</b>: User-provided metadata, in key/value pairs.
    <ul>
        <li><b>metadata.key</b>: An individual metadata entry key.</li>
        <li><b>metadata.value</b>: An individual metadata entry value.</li>
    </ul>
    </li>
</ul>
</div>

# Project Attributes

<div style="text-align: justify; line-height: 1.5;">

Inside this view we can see metadata about the available projects inside your organization.

<br>
This table has the following columns:
<br>

<ul>
    <li><b>snapshotTime</b>: The snapshot time of the object metadata in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>project</b>: The project number</li>
    <li><b>projectName</b>: The project name</li>
    <li><b>projectID</b>: The project ID</li>
</ul>

# Regions Information CTE

<div style="text-align: justify; line-height: 1.5;">
The <i>Regions Information</i> Common Table Expression (CTE) provides foundational geographical information for all analyses. It joins the location column to approximate latitude and longitude for each region, identifies associated countries, and facilitates map generation using a predefined GeoJSON file.

<br>
This table has the following columns:
<br>

<ul>
    <li><b>location</b>: The <a href="https://cloud.google.com/storage/docs/locations" target="_blank"> location</a> of the source bucket.</li>
    <li><b>geographic_area</b>: The Gographic Area is determined by the bucket's location, as specified in the official documentation for <a href="https://cloud.google.com/storage/docs/locations#location-r" target="_blank"> location</a>Single-Region locations</a>. The available zones are categorized into these regions: North America, South America, Europe, Asia, India, Indonesia, the Middle East, Australia, and Africa</li>
    <li><b>location_type</b>: The location type is contingent upon the region configuration. It may be Single-Region, Dual-Region, or Multi-Region.</li>
    <li><b>countries</b>: The different countries' combinations that are based on the selected region.</li>
    <li><b>state</b>: The different state combinations that are based on the selected region.</li>
    <li><b>city</b>: The different city  combinations that are based on the selected region.</li>
    <li><b>latitude</b>: The latitude of the selected region.</li>
    <li><b>longitude</b>: The longitude of the selected region.</li>
</ul>
</div>

# Bucket and Object Attributes Persistent Derived Tables
<div style="text-align: justify; line-height: 1.5;">
To optimize performance for large Bucket Attributes and Object Attributes tables, we implemented a method to retrieve the latest information without querying the original tables. This data is stored in a <i>looker-scratch-schema</i> within a separate dataset, preconfigured during the gcs-storage-intelligence dataset setup in Looker.
<br>

To explain the CTEs incorporated within this Persistent Derived Table, we will begin by examining the following SQL statement:
</div>


```

WITH
    distinct_snapshots AS (
        SELECT
          DISTINCT snapshotTime
        FROM
          `@{project_id}.@{bigquery_dataset}.object_attributes_view`
        WHERE
          snapshotTime IS NOT NULL
        INTERSECT DISTINCT
        SELECT
          DISTINCT snapshotTime
        FROM
          `@{project_id}.@{bigquery_dataset}.bucket_attributes_view`
        WHERE
          snapshotTime IS NOT NULL)

```

<div style="text-align: justify; line-height: 1.5;">
The <b>distinct_snapshots</b> table provides a comprehensive list of all unique snapshot timestamps found across the Bucket and Object tables. This resource facilitates the retrieval of the latest snapshot for subsequent querying and analysis.


<br>
Subsequently, the latest bucket and object attributes are retrieved by filtering based on the maximum snapshotTime value.

</div>



```
bucket_attributes_latest AS (
        SELECT
          *
        FROM
          `@{project_id}.@{bigquery_dataset}.bucket_attributes_view`
        WHERE
          snapshotTime = (
            SELECT
              MAX(snapshotTime)
            FROM
              distinct_snapshots
          )
```

```
object_attributes_latest AS (
        SELECT
          *
        FROM
          `@{project_id}.@{bigquery_dataset}.object_attributes_view`
        WHERE
          snapshotTime = (
            SELECT
              MAX(snapshotTime)
            FROM
              distinct_snapshots
          )
```

<div style="text-align: justify; line-height: 1.5;">
These Derived Tables will be materialized as actual tables within your Looker scratch schema dataset. To control the table creation process, both table types will utilize a datagroup parameter: <i>gcs_storage_intelligence_datagroup</i> .

<br>
To understand how this datagroup is utilized by Looker, it is essential to examine its associated SQL trigger:

</div>

```
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
```

<div style="text-align: justify; line-height: 1.5;">
The provided SQL statement defines a Common Table Expression (CTE) named st_total. This CTE retrieves the snapshotTime from the manifest table and an aggregated count of events derived from the objects_attributes_view. Should either of these values change, the datagroup's sql_trigger prompts Looker to rebuild the associated Persistent Derived Table (PDT) utilizing the latest data.
</div>


# Connection

<div style="text-align: justify; line-height: 1.5;">

This section provides an overview of the necessary steps to connect your Google Cloud Storage Intelligence dataset with Looker.
<ol>
    <li>Enable the Google Cloud Storage - Storage Intelligence Dataset by following the instructions in the Storage Intelligence User Guide.
    </li>
    <li>Create the connection with Looker:
        <ol>
            <li>Within your Google Cloud project, configure the authentication method that Looker will utilize to access your BigQuery environment. Looker supports the following authentication options for BigQuery:
            <ul>
                <li><b>Service Account</b>: Refer to the documentation section titled <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery#bigquery_service_accounts" target="_blank">Authentication with BigQuery service accounts</a> for detailed information.</li>
                <li><b>OAuth</b>: Refer to the documentation section titled <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery#oauth_for_bigquery_connections" target="_blank">Authentication with OAuth</a> for detailed information.</li>
            </ul>
            </li>
            <li>Within your BigQuery project, create a temporary dataset that Looker will utilize for Persistent Derived Tables (PDTs). (Learn more about <a href="https://cloud.google.com/looker/docs/derived-tables#persistent-derived-tables" target="_blank">persistent derived tables (PDTs)</a>). The procedure for creating this temporary dataset is detailed in the documentation section: <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery#creating_a_temporary_dataset_for_persistent_derived_tables" target="_blank">Creating a temporary dataset for persistent derived</a> for the necessary procedure.
            <ul>
                <li><b>Note</b>: If utilizing OAuth authentication and enabling PDT functionality on the connection, a dedicated BigQuery service account must be created for Looker's PDT operations. The procedure is detailed in the documentation section: <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery#bq_pdts_oauth" target="_blank">Enabling PDTs for Looker connections to BigQuery with OAuth</a>.</li>
            </ul>
            </li>
            <li>In Looker, set up the Looker connection to your BigQuery database. See the section <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery#connecting_looker_to_bigquery" target="_blank">Connecting Looker to BigQuery</a> on this page for the procedure.</li>
            <li>In Looker, test the connection between Looker and your BigQuery database. See the section <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery#testing_the_connection" target="_blank">Testing the connection</a> on this page for the procedure.</li>
        </ol>
    </li>
    <li> <b>IF YOU ARE USING A CUSTOMER - HOSTED INSTANCE: Follow steps 3 and 4 of this guide. IF YOU HAVE ACCESS TO THE MARKETPLACE, follow step 5.</b> Download the <b>GCS - Storage Intelligence</b> LookML code from the Looker Open Source Git Repository:
        <ol>
            <li>Navigate to the GCS - Storage Intelligence - Looker Open Source Git Repository. Select the 'CODE' button and download the repository as a ZIP archive. </li>
            <li>Once the files have been obtained, you may integrate these files into your enterprise Git repository.</li>
        </ol>
    </li>
    <li>Create a New LookMl project:
        <ol>
            <li><a href="https://cloud.google.com/looker/docs/dev-mode-prod-mode#switching_in_and_out_of_development_mode" target="_blank">Verify that you are in Development Mode</a>.</li>
            <li>Select <b>Projects</b> from the <b>Develop</b> section of the navigation panel.</li>
            <li>On the <b>LookML Projects</b> page, select <b>New LookML Project</b>  to configure the settings for your project.</li>
            <li>Name the project: <b><i>gcs_storage_intelligence_block</i></b> and select: <b>"Create Blank Project"</b></li>
            <li>Upload all the files and folders to the created project.</li>
            <li>Inside the manifest you will see the following code snippet. Please update these values with the corresponding names for your looker connection name, GCP project ID and BigQuery dataset ID:
            <pre>
            <code>
                constant: connection_name {
                    value: "your_connection_name"
                    export: override_optional
                }
                constant: project_id {
                    value: "your_project_id"
                    export: override_optional
                }
                constant: bigquery_dataset {
                    value: "your_bigquery_dataset"
                    export: override_optional
                }
            </code>
            </pre>
            </li>
        </ol>
    </li>
    <li>To install the GCS - Storage Intelligence Dashboard from the Looker Marketplace, navigate to your Looker instance's Marketplace. Locate the dashboard, click 'Install', and provide the connection details when prompted.</li>
    <li>Visualize the dashboards under the <a href="/dashboards/gcs_storage_intelligence::general_analysis" target="_blank">LookML dashboard folder</a></li>
</ol>
</div>



<div style="text-align: justify; line-height: 1.5;">
<h1>Coming Soon</h1>
This section details the projects that will be integrated into Storage Intelligence: <br> <br>

<br>
We are currently developing additional features that will provide complementary insights to your Google Cloud Storage analysis.
</div>
