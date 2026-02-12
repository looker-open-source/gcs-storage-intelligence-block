# Google Cloud Storage - Storage Intelligence - Looker Dashboard

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
    <li>We are excited for customers to use the datasets Google Cloud Storage is providing. To start the setup process, we recommend reviewing the introductory statement on <a href="https://cloud.google.com/storage/docs/storage-intelligence/overview" target="_blank">Storage Intelligence</a>. Following this, please consult the guidelines for activating your GCS datasets within your GCP environment, detailed under <a href="https://cloud.google.com/storage/docs/storage-intelligence/configure-and-manage-storage-intelligence" target="_blank">Configure and manage Storage Intelligence</a>.</li>
    <li>If you are experiencing any issues related to permissions configuration and timeliness of reports availability. The team is available at <i>insights-customer-support@google.com</i> to help troubleshoot and address any concerns.</li>
    <li>Enabling these Datasets for your production environment (GCP Projects) will not have any operational impact on the GCS Bucket storage/serving workloads. However you will be applying new permissions to production resources so please plan accordingly.</li>
    <li>Datasets generated can be configured to capture data from different GCP Regions and consolidate into a single Linked Dataset in BigQuery. Please take that into consideration if your metadata has regional/sovereignty requirements. Configuring one Dataset per sovereign region is one option available to help address these requirements.</li>
</ol>

</div>

# Google Cloud Storage Intelligence
## What does this Looker Block do for me?

<div style="text-align: justify; line-height: 1.5;">

<p>Designed for Google Cloud Storage (GCS) users, this Looker block facilitates obtaining deep analytical insights from extensive datasets by seamlessly integrating Storage Intelligence data into Looker. It supports the identification of key usage patterns, potential inefficiencies, and opportunities for optimization and cost management, enabling advanced data analysis.</p>

<p>In order to obtain these high-level dashboards, this block creates:</p>

<h3>Implementation Details</h3>

<ul>
    <li>
        <b>Dynamic Derived Tables</b> — These tables are calculated at runtime to provide context-aware data based on user selections:
        <ul>
            <li>
                <i>Bucket Attributes History:</i> Aggregates snapshot data—including location, project, and storage class—directly from the <code>bucket_attributes_view</code>.
            </li>
            <li>
                <i>Bucket Totals Summary:</i> Calculates total ingress and egress per bucket. It utilizes Looker <code>{% condition %}</code> filters to ensure totals align dynamically with the user's selected <b>snapshot_start_date</b> and <b>snapshot_end_date</b>.
            </li>
        </ul>
    </li>
    <li>
        <b>Static Helper Tables (Unpivoting)</b> — These views are used via <code>CROSS JOIN</code> to transform separate status columns into a single dimension, enabling improved breakdown visualizations like Pie Charts or Bar Graphs:
        <ul>
            <li>
                <i>Client Error Status:</i> Generates a static list of 4xx error codes (400, 401, 403, 429).
            </li>
            <li>
                <i>Status Values:</i> Provides a global mapping for status labels (2xx, 4xx, 5xx).
            </li>
        </ul>
    </li>
    <li>
        <b>Regional Insights</b> — A specific Derived Table containing <a href="https://cloud.google.com/about/locations" target="_blank">GCP regions information</a> is joined to all available views to enable geolocation-based analysis by country and region.
    </li>
    <li>
        <b>Row-Column Flexibility</b> — Various <b>parameters</b> are implemented within the LookML to allow users to dynamically control the report format and layout.
    </li>
</ul>

<h3>Project Structure</h3>

<ul>
    <li><b>Explores:</b> Business-ready entry points (e.g., <code>bucket_activity</code>, <code>object_events</code>) for self-service analysis.</li>
    <li><b>Views:</b> LookML representations of BigQuery tables and the custom Derived Tables described above.</li>
    <li><b>Attributes:</b> Centralized configurations for <code>datagroups</code>, <code>map_layers</code>, and <code>value_formats</code>.</li>
    <li><b>Dashboards:</b> Pre-built operational dashboards, including <i>Bucket Region Activity</i> and <i>Security & Compliance</i>.</li>
    <li><b>Maps:</b> Custom <code>geojson</code> files used to support specialized geographical visualizations.</li>
</ul>

<p> To successfully integrate GCS Storage Intelligence data into BigQuery, please refer to the detailed instructions provided in the <a href="https://cloud.google.com/storage/docs/storage-intelligence/configure-and-manage-storage-intelligence" target="_blank">Configure and manage Storage Intelligence</a> guide.</p>

</div>

# GCS Storage Intelligence Data Structure

<div style="text-align: justify; line-height: 1.5;">

<h3>Available BigQuery Views</h3>

<p>The solution utilizes the following views as primary data sources:</p>

<ul>
    <li><code>bucket_activity_view</code></li>
    <li><code>bucket_attributes_view</code></li>
    <li><code>bucket_attributes_latest_snapshot_view</code></li>
    <li><code>bucket_region_activity_view</code></li>
    <li><code>error_attributes_view</code></li>
    <li><code>events_view</code></li>
    <li><code>object_attributes_view</code></li>
    <li><code>object_attributes_latest_snapshot_view</code></li>
    <li><code>object_events_view</code></li>
    <li><code>project_activity_view</code></li>
    <li><code>project_attributes_view</code></li>
</ul>

</div>


# Bucket Metadata

<div style="text-align: justify; line-height: 1.5;">

<p>The bucket metadata schema includes the <code>bucket_attributes_view</code> and <code>bucket_attributes_latest_snapshot_view</code> tables. These tables contain the following fields:</p>

<ul>
    <li><b>snapshotTime</b>: The time of the bucket metadata snapshot refresh in <a href="https://datatracker.ietf.org/doc/html/rfc3339">RFC 3339</a> format. All records from the same snapshot refresh share this value.</li>
    <li><b>name</b>: The name of the bucket.</li>
    <li><b>location</b>: The location where object data resides. See <a href="https://cloud.google.com/storage/docs/locations">Cloud Storage bucket locations</a>.</li>
    <li><b>project</b>: The project number of the project the bucket belongs to.</li>
    <li><b>storageClass</b>: The bucket's default storage class. See <a href="https://cloud.google.com/storage/docs/storage-classes">Storage classes</a>.</li>
    <li><b>lifecycle</b>: A boolean indicating if the bucket has a <a href="https://cloud.google.com/storage/docs/lifecycle">lifecycle configuration</a>.</li>
    <li><b>metageneration</b>: The metadata generation of this bucket.</li>
    <li><b>timeCreated</b>: The creation time of the bucket in <a href="https://datatracker.ietf.org/doc/html/rfc3339">RFC 3339</a> format.</li>
    <li><b>iamConfiguration</b>: The IAM configuration for the bucket.
        <ul>
            <li><b>iamConfiguration.publicAccessPrevention</b>: Status of <a href="https://cloud.google.com/storage/docs/public-access-prevention">public access prevention</a> ("inherited" or "enforced").</li>
            <li><b>iamConfiguration.uniformBucketLevelAccess.enabled</b>: Whether <a href="https://cloud.google.com/storage/docs/uniform-bucket-level-access">uniform bucket-level access</a> is enabled.</li>
        </ul>
    </li>
    <li><b>autoclass</b>: The bucket's <a href="https://cloud.google.com/storage/docs/autoclass">Autoclass configuration</a>.
        <ul>
            <li><b>autoclass.enabled</b>: Whether Autoclass is enabled.</li>
            <li><b>autoclass.toggleTime</b>: The last time Autoclass was enabled or disabled.</li>
        </ul>
    </li>
    <li><b>softDeletePolicy</b>: Defines the retention period for soft-deleted objects.
        <ul>
            <li><b>softDeletePolicy.effectiveTime</b>: The time from which the current policy (or a stricter one) became effective.</li>
            <li><b>softDeletePolicy.retentionDurationSeconds</b>: Retention period in seconds (between 604,800 and 7,776,000).</li>
        </ul>
    </li>
    <li><b>resourceTags</b>: The bucket's <a href="https://cloud.google.com/storage/docs/tags-and-labels#tags">Tags</a> for access control.
        <ul>
            <li><b>resourceTags.key</b>: The tag key.</li>
            <li><b>resourceTags.value</b>: The tag value.</li>
        </ul>
    </li>
    <li><b>labels</b>: User-provided <a href="https://cloud.google.com/storage/docs/tags-and-labels#bucket-labels">bucket labels</a> (key-value pairs).
        <ul>
            <li><b>labels.key</b>: The label key.</li>
            <li><b>labels.value</b>: The label value.</li>
        </ul>
    </li>
    <li><b>public <small>(Deprecated)</small></b>: Indicates public accessibility. Use <code>iamConfiguration</code> instead.</li>
    <li><b>tags <small>(Deprecated)</small></b>: User-defined key-value pairs. Use <code>resourceTags</code> instead.</li>
</ul>
</div>



# Error codes

<div style="text-align: justify; line-height: 1.5;">

<h3>Error Attributes Schema</h3>
<p>The <code>error_attributes_view</code> view displays errors related to snapshot processing and configuration. Use this table to debug why certain projects or buckets may be missing from your reports.</p>

<ul>
    <li><b>errorCode</b>: The unique numerical code for the error. See the troubleshooting table below for details.</li>
    <li><b>errorSource</b>: The source of the error. Valid value: <code>CONFIGURATION_PREPROCESSING</code>.</li>
    <li><b>errorTime</b>: The time the error occurred in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>sourceGcsLocation</b>: The source location of the error. This field is <code>null</code> for project-level errors.</li>
    <li><b>bucketErrorRecord</b>: Data for debugging bucket-level issues.
        <ul>
            <li><b>bucketName</b>: The name of the bucket involved in the error.</li>
            <li><b>serviceAccount</b>: The service account that requires permissions for the bucket.</li>
        </ul>
    </li>
    <li><b>projectErrorRecord</b>: Data for debugging project-level issues.
        <ul>
            <li><b>projectNumber</b>: The number of the project involved in the error.</li>
            <li><b>organizationName</b>: The name of the organization the project must belong to. A value of <code>0</code> indicates the project is not in the organization.</li>
        </ul>
    </li>
</ul>

<h4>Troubleshoot Dataset Errors</h4>
<table border="1" cellpadding="10" cellspacing="0">
    <thead>
        <tr>
            <th>Code</th>
            <th>Error Case</th>
            <th>Troubleshooting</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b>1</b></td>
            <td>Source project not in organization</td>
            <td>Ensure <code>projectErrorRecord.projectNumber</code> is correctly added to the organization.</td>
        </tr>
        <tr>
            <td><b>2</b></td>
            <td>Bucket authorization error</td>
            <td>Grant the service agent IAM permissions to allow ingestion of objects for <code>bucketErrorRecord.bucketName</code>.</td>
        </tr>
        <tr>
            <td><b>3</b></td>
            <td>Destination project not in organization</td>
            <td>Add the destination project to the organization.</td>
        </tr>
        <tr>
            <td><b>4</b></td>
            <td>Source project Storage Intelligence error</td>
            <td>Ensure <a href="https://cloud.google.com/storage/docs/insights/configure-datasets" target="_blank">Storage Intelligence</a> is configured for the source project.</td>
        </tr>
        <tr>
            <td><b>5</b></td>
            <td>Bucket Storage Intelligence error</td>
            <td>Ensure <a href="https://cloud.google.com/storage/docs/insights/configure-datasets" target="_blank">Storage Intelligence</a> is configured for the specific bucket.</td>
        </tr>
        <tr>
            <td><b>6</b></td>
            <td>Activity access authentication error</td>
            <td>Grant IAM permissions to the service agent to allow ingestion of <b>activity data</b> for the bucket.</td>
        </tr>
    </tbody>
</table>


</div>

# Object Activity Data

<div style="text-align: justify; line-height: 1.5;">
<p>The <code>object_events_view</code> table provides queryable records of create, update, and delete object operations, metadata, and details about errors encountered. This data includes the following fields:</p>

<ul>
    <li><b>bucketName</b>: The name of the bucket specified in the request.</li>
    <li><b>errorReason</b>: The reason for the error (currently limited to 429 errors).</li>
    <li><b>generation</b>: The content generation of the object, used for object versioning.</li>
    <li><b>location</b>: The physical location of the object.</li>
    <li><b>objectName</b>: The name of the object specified in the request. This field can be null.</li>
    <li><b>project</b>: The project number that owns the bucket resource.</li>
    <li><b>requestBytes</b>: The number of bytes sent in the request.</li>
    <li><b>requestCompletionTimestamp</b>: The timestamp when the request was completed, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>requestHost</b>: The host specified in the original request.</li>
    <li><b>requestHttpMethod</b>: The HTTP method used for the request (e.g., PUT, POST, DELETE).</li>
    <li><b>requestId</b>: The unique identifier for the request.</li>
    <li><b>requestOperation</b>: The Cloud Storage operation performed (limited to write, update, and delete operations). This field can be null.</li>
    <li><b>requestProcessingTimeMicros</b>: The time in microseconds the server took to process the request.</li>
    <li><b>requestReferrer</b>: The HTTP referrer for the request.</li>
    <li><b>responseBytes</b>: The number of bytes sent in the response.</li>
    <li><b>responseStatus</b>: The HTTP status code sent in the server's response.</li>
    <li><b>size</b>: The size of the object in bytes.</li>
    <li><b>storageClass</b>: The storage class of the object.</li>
    <li><b>timeCreated</b>: The object's creation time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
</ul>
</div>

# Project Activity

<div style="text-align: justify; line-height: 1.5;">

<p>The <code>project_activity_view</code> table offers aggregated operational insights across your projects. This table summarizes activity by counting operation types, bytes transferred, and response codes.</p>

<ul>
    <li><b>count2xx</b>: The total number of 2xx success responses.</li>
    <li><b>count400</b>: The total number of 400 errors for bad requests.</li>
    <li><b>count401</b>: The total number of 401 errors for unauthorized requests.</li>
    <li><b>count403</b>: The total number of 403 errors for forbidden requests.</li>
    <li><b>count429</b>: The total number of 429 errors for usage limit exceeded requests.</li>
    <li><b>count4xx</b>: The total number of 4xx errors.</li>
    <li><b>count5xx</b>: The total number of 5xx errors.</li>
    <li><b>project</b>: The project number.</li>
    <li><b>snapshotEndTime</b>: The snapshot's end time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>snapshotStartTime</b>: The snapshot's start time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>totalDeletes</b>: The total number of delete operations.</li>
    <li><b>totalLists</b>: The total number of list operations.</li>
    <li><b>totalReads</b>: The total number of read operations.</li>
    <li><b>totalRequestBytes</b>: The total number of request bytes transferred.</li>
    <li><b>totalRequests</b>: The total number of requests made across the project.</li>
    <li><b>totalResponseBytes</b>: The total number of response bytes transferred.</li>
    <li><b>totalUpdates</b>: The total number of update operations.</li>
    <li><b>totalWrites</b>: The total number of write operations.</li>
</ul>

</div>

# Bucket Activity

<div style="text-align: justify; line-height: 1.5;">
    <p>The <code>bucket_activity_view</code> table offers aggregated operational insights across your buckets, including operation types, bytes transferred, response codes, and top prefixes. </p>

<ul>
    <li><b>count2xx</b>: The total number of 2xx success responses.</li>
    <li><b>count400</b>: The total number of 400 errors for bad requests.</li>
    <li><b>count401</b>: The total number of 401 errors for unauthorized requests.</li>
    <li><b>count403</b>: The total number of 403 errors for forbidden requests.</li>
    <li><b>count429</b>: The total number of 429 errors for usage limit exceeded requests.</li>
    <li><b>count4xx</b>: The total number of 4xx errors.</li>
    <li><b>count5xx</b>: The total number of 5xx errors.</li>
    <li><b>generation</b>: The bucket's generation number.</li>
    <li><b>location</b>: The location of the bucket.</li>
    <li><b>name</b>: The name of the bucket.</li>
    <li><b>project</b>: The project number.</li>
    <li><b>snapshotEndTime</b>: The snapshot's end time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>snapshotStartTime</b>: The snapshot's start time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>topPrefixes429Errors</b>: The top 5 bucket prefixes with the most 429 errors.
        <ul>
            <li><b>prefix</b>: The bucket prefix string.</li>
            <li><b>count</b>: The error count.</li>
        </ul>
    </li>
    <li><b>topPrefixesHighestOperations</b>: The top 5 bucket prefixes with the highest number of operations.
        <ul>
            <li><b>prefix</b>: The bucket prefix string.</li>
            <li><b>count</b>: The operation count.</li>
        </ul>
    </li>
    <li><b>topPrefixesRequestBytes</b>: The top 5 bucket prefixes with the highest number of requested bytes.
        <ul>
            <li><b>prefix</b>: The bucket prefix string.</li>
            <li><b>count</b>: The byte count.</li>
        </ul>
    </li>
    <li><b>topPrefixesResponseBytes</b>: The top 5 bucket prefixes with the highest number of response bytes.
        <ul>
            <li><b>prefix</b>: The bucket prefix string.</li>
            <li><b>count</b>: The byte count.</li>
        </ul>
    </li>
    <li><b>totalDeletes</b>: The total number of delete operations.</li>
    <li><b>totalLists</b>: The total number of list operations.</li>
    <li><b>totalReads</b>: The total number of read operations.</li>
    <li><b>totalRequestBytes</b>: The total number of request bytes transferred.</li>
    <li><b>totalRequests</b>: The total number of requests made on the bucket.</li>
    <li><b>totalResponseBytes</b>: The total number of response bytes transferred.</li>
    <li><b>totalUpdates</b>: The total number of update operations.</li>
    <li><b>totalWrites</b>: The total number of write operations.</li>
</ul>
</div>

# Bucket Region Activity

<div style="text-align: justify; line-height: 1.5;">

<p>The <code>bucket_region_activity_view</code> table summarizes the total bytes sent and received for a bucket, aggregated by destination region. Use this data to identify regional egress patterns and optimize bucket placement for performance and cost.</p>

<ul>
    <li><b>bucketLocation</b>: The location of the bucket.</li>
    <li><b>generation</b>: The bucket's generation number.</li>
    <li><b>name</b>: The name of the bucket.</li>
    <li><b>project</b>: The project number for the bucket.</li>
    <li><b>requestBytes</b>: The total number of bytes transferred for requests between the specified bucket and the <code>requestLocation</code>.</li>
    <li><b>requestLocation</b>: The Google Cloud location where the request originated.</li>
    <li><b>responseBytes</b>: The total number of bytes transferred for responses between the specified bucket and the <code>requestLocation</code>.</li>
    <li><b>snapshotEndTime</b>: The snapshot's end time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>snapshotStartTime</b>: The snapshot's start time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
</ul>

</div>

# Events log

<div style="text-align: justify; line-height: 1.5;">

<p>The events log schema includes the <code>events_log_view</code> table. This view displays the timestamps and status codes for when data becomes available in the metadata or activity views.</p>

<ul>
    <li><b>eventCode</b>: The event code associated with the corresponding entry. The values are as follows:
        <ul>
            <li><b>eventCode 1</b>: Indicates that the <code>manifest.viewName</code> view is refreshed with all entries for the source location (<code>manifest.location</code>) within the snapshot (<code>manifest.snapshotTime</code>).</li>
            <li><b>eventCode 2</b>: Indicates that the dataset is refreshed with the bucket and object entries for all source locations. The refresh occurs within the snapshot (<code>globalManifest.snapshotTime</code>).</li>
            <li><b>eventCode 3</b>: Refers to the activity data views being refreshed with all entries for the source location (<code>manifest.location</code>) within the log window.</li>
        </ul>
    </li>
    <li><b>eventTime</b>: The time the event occurred in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>globalManifest.snapshotTime</b>: The ingestion completion time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format, for the bucket and object attributes tables across all source locations.</li>
    <li><b>manifest</b>: Information regarding the specific data refresh event.
        <ul>
            <li><b>manifest.location</b>: The source location (region or multi-region) of the data that refreshes.</li>
            <li><b>manifest.snapshotTime</b>: The time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format, when the snapshot of the events is refreshed.</li>
            <li><b>manifest.viewName</b>: The name of the view that refreshes (e.g., <code>bucket_attributes_view</code>, <code>object_attributes_view</code>, or activity views).</li>
        </ul>
    </li>
</ul>

</div>

# Object Metadata

<div style="text-align: justify; line-height: 1.5;">
<p>The object metadata schema includes the <code>object_attributes_view</code> and <code>object_attributes_latest_snapshot_view</code> tables. These tables have the following fields:</p>

<ul>
    <li><b>snapshotTime</b>: The time of the object metadata snapshot refresh in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format. All records generated from the same snapshot refresh have the same <code>snapshotTime</code>.</li>
    <li><b>bucket</b>: The name of the bucket containing this object.</li>
    <li><b>name</b>: The name of the object.</li>
    <li><b>size</b>: <a href="https://datatracker.ietf.org/doc/html/rfc7230#section-3.3.2" target="_blank">Content-Length</a> of the data in bytes.</li>
    <li><b>storageClass</b>: Storage class of the object.</li>
    <li><b>generation</b>: The content <a href="https://cloud.google.com/storage/docs/metadata#generation-number" target="_blank">generation</a> of this object. Used for object versioning.</li>
    <li><b>metageneration</b>: The version of the metadata for this object at this generation. Used for preconditions and for detecting changes in metadata.</li>
    <li><b>contentType</b>: <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-3.1.1.5" target="_blank">Content-Type</a> of the object data. If an object is stored without a Content-Type, it is served as <code>application/octet-stream</code>.</li>
    <li><b>contentEncoding</b>: <a href="https://datatracker.ietf.org/doc/html/rfc7231#section-3.1.2.2" target="_blank">Content-Encoding</a> of the object data.</li>
    <li><b>contentDisposition</b>: <a href="https://datatracker.ietf.org/doc/html/rfc6266" target="_blank">Content-Disposition</a> of the object data.</li>
    <li><b>contentLanguage</b>: <a href="https://cloud.google.com/storage/docs/metadata#content-language" target="_blank">Content-Language</a> of the object data.</li>
    <li><b>timeCreated</b>: The creation time of the object in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>updated</b>: The <a href="https://cloud.google.com/storage/docs/metadata#modification-time" target="_blank">modification time</a> of the object metadata in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>timeDeleted</b>: The time the object was deleted in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format. Returned only if the version is a <a href="https://cloud.google.com/storage/docs/object-versioning" target="_blank">noncurrent version</a>.</li>
    <li><b>timeStorageClassUpdated</b>: The time at which the object's storage class was last changed.</li>
    <li><b>customTime</b>: A user-specified timestamp for the object in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format.</li>
    <li><b>crc32c</b>: CRC32c checksum, as described in <a href="https://datatracker.ietf.org/doc/html/rfc4960#appendix-B" target="_blank">RFC 4960, Appendix B</a>; encoded using <a href="https://datatracker.ietf.org/doc/html/rfc4648#section-4" target="_blank">base64</a>.</li>
    <li><b>md5Hash</b>: MD5 hash of the data, encoded using <a href="https://datatracker.ietf.org/doc/html/rfc4648#section-4" target="_blank">base64</a>. This field is not present for composite objects.</li>
    <li><b>etag</b>: HTTP 1.1 <a href="https://datatracker.ietf.org/doc/html/rfc7232#section-2.3" target="_blank">Entity tag</a> for the object.</li>
    <li><b>componentCount</b>: Returned for <a href="https://cloud.google.com/storage/docs/composite-objects" target="_blank">composite objects</a> only. The number of non-composite objects in the composite object.</li>
    <li><b>kmsKeyName</b>: The Cloud KMS resource name of the <a href="https://cloud.google.com/storage/docs/encryption/customer-managed-keys" target="_blank">customer-managed encryption key</a> used to encrypt the object.</li>
    <li><b>temporaryHold</b>: Whether or not the object is subject to a <a href="https://cloud.google.com/storage/docs/object-holds#hold-types" target="_blank">temporary hold</a>.</li>
    <li><b>eventBasedHold</b>: Whether or not the object is subject to an <a href="https://cloud.google.com/storage/docs/object-holds#hold-types" target="_blank">event-based hold</a>.</li>
    <li><b>retentionExpirationTime</b>: The earliest time that the object can be deleted, based on <a href="https://cloud.google.com/storage/docs/object-lock" target="_blank">retention configurations</a>.</li>
    <li><b>softDeleteTime</b>: If this object has been soft-deleted, this is the time at which it became soft-deleted.</li>
    <li><b>hardDeleteTime</b>: The time when the object will no longer be restorable. Set only for soft-deleted objects.</li>
    <li><b>metadata</b>: User-provided metadata, in key/value pairs.
        <ul>
            <li><b>metadata.key</b>: An individual metadata entry key.</li>
            <li><b>metadata.value</b>: An individual metadata entry value.</li>
        </ul>
    </li>
    <li><b>selfLink</b>: A URL for this object.</li>
    <li><b>mediaLink</b>: A URL for downloading the object's data.</li>
</ul>
</div>

# Project Metadata

<div style="text-align: justify; line-height: 1.5;">

<p>The project metadata schema includes the <code>project_attributes_view</code> table. This table have the following fields:</p>

<ul>
    <li><b>snapshotTime</b>: The <code>snapshotTime</code> field stores the time of the project metadata snapshot refresh in <a href="https://datatracker.ietf.org/doc/html/rfc3339" target="_blank">RFC 3339</a> format. All records that are generated from the same snapshot refresh have the same <code>snapshotTime</code>.</li>
    <li><b>project</b>: The project number of the project.</li>
    <li><b>projectId</b>: The project ID of the project.</li>
    <li><b>projectName</b>: The name of the project.</li>
</ul>
</div>

# Regions Information CTE

<div style="text-align: justify; line-height: 1.5;">
The <i>Regions Information</i> Common Table Expression (CTE) provides foundational geographical information for all analyses. It joins the location column to approximate latitude and longitude for each region, identifies associated countries, and facilitates map generation using a predefined GeoJSON file.

<br>
This table has the following columns:
<br>

<ul>
    <li><b>location</b>: The <a href="https://cloud.google.com/storage/docs/locations" target="_blank"> location</a> of the source bucket.</li>
    <li><b>geographic_area</b>: The Gographic Area is determined by the bucket's location, as specified in the official documentation for <a href="https://cloud.google.com/storage/docs/locations#location-r" target="_blank"> location</a>. The available zones are categorized into these regions: North America, South America, Europe, Asia, India, Indonesia, the Middle East, Australia, and Africa</li>
    <li><b>location_type</b>: The location type is contingent upon the region configuration. It may be Single-Region, Dual-Region, or Multi-Region.</li>
    <li><b>countries</b>: The different countries' combinations that are based on the selected region.</li>
    <li><b>state</b>: The different state combinations that are based on the selected region.</li>
    <li><b>city</b>: The different city  combinations that are based on the selected region.</li>
    <li><b>latitude</b>: The latitude of the selected region.</li>
    <li><b>longitude</b>: The longitude of the selected region.</li>
</ul>
</div>

# Visualizations
<div style="text-align: justify; line-height: 1.5;">
<h3>Sankey Visualization for Bucket Region Activity</h3>
<p>The <b>Bucket Region Activity</b> dashboard utilizes the <b>Sankey Diagram Visualization</b> to effectively map the flow of data between your bucket locations and the regions where requests originate. This visualization must be installed in your Looker instance for the dashboard to render correctly.</p>

<h4>Option 1: Install via Looker Marketplace</h4>
<ol>
    <li>Navigate to your Looker instance and click the <b>Marketplace icon</b> (storefront symbol) in the top-right corner.</li>
    <li>Select <b>Manage</b> to check if the "Sankey" visualization is already installed.</li>
    <li>If it is not installed, click <b>Discover</b> and search for "Sankey Visualization".</li>
    <li>Select the visualization, click <b>Install</b>, and follow the on-screen steps to complete the setup.</li>
</ol>

<h4>Option 2: Manual Installation (GitHub Fallback)</h4>
<p>If you do not have access to the Looker Marketplace, you can install the visualization manually:</p>
<ol>
    <li>Visit the <a href="https://github.com/looker-open-source/viz-sankey-marketplace" target="_blank">Sankey Visualization GitHub repository</a>.</li>
    <li>Download the repository files to your local machine.</li>
    <li>In Looker, create a new blank project (e.g., <code>sankey-viz</code>).</li>
    <li>Upload the downloaded files into this new Looker project.</li>
    <li>Once the project is saved and deployed, the Sankey diagram will become available for use in your dashboards.</li>
</ol>

<p><i>Note: If you encounter any technical issues during the installation process, please contact Looker Support for assistance.</i></p>
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
            <li>In Looker, test the connection to your BigQuery database. See the section <a href="https://cloud.google.com/looker/docs/db-config-google-bigquery#connecting_looker_to_bigquery" target="_blank">Connecting Looker to BigQuery</a> on this page for the procedure.</li>
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
            <li>By default, this Looker Block fetches GeoJSON map files from a public URL. If your Looker instance does not have access to the public internet, you will need to configure the map layers to use the local files included in this repository.
              <ol>
                  <li>Locate the configuration files inside the `/attributes/map_layers/` directory.</li>
                  <li>For each map_layer definition, you must modify the code to use the file parameter instead of the url parameter.</li>
                  <li>Comment out the line containing the url parameter.</li>
                  <li>Uncomment and verify the line containing the file parameter. The path should be relative to your project root.</li>
              </ol>
              <pre>
              <code>
                map_layer: gcs_regions {
                  file: "/maps/regions.geojson"
                  #url: "https://storage.googleapis.com/gcs-storage-intelligence-looker-files/regions.geojson"
                  property_key: "Region"
                }
              </code>
              </pre>
            </li>
            <li>Inside the manifest you will see the following code snippet. Please update these values with the corresponding names for your looker connection name, GCP project ID and BigQuery dataset ID:
            <pre>
            <code>
                constant: CONNECTION_NAME {
                    value: "your_connection_name"
                    export: override_required
                }
                constant: PROJECT_ID {
                    value: "your_project_id"
                    export: override_required
                }
                constant: BIGQUERY_DATASET {
                    value: "your_bigquery_dataset"
                    export: override_required
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
We are currently developing additional features that will provide complementary insights to your Google Cloud Storage analysis.
</div>
