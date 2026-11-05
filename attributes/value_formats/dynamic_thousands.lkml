# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: March 24, 2025
# Modified Date: Nov 4, 2026
# Purpose: Defines a dynamic named value format scaling thousands, millions, and billions.
# --------------------------------------------------------------------------

named_value_format: dynamic_thousands {
  value_format: "[>=1000000000]0.0,,,\" B\";[>=1000000]0.0,,\" M\";[>=1000]0.0,\" K\";0"
}
