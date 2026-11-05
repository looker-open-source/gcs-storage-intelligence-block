# --------------------------------------------------------------------------
# Owner: Google Cloud Storage
# Contact Method: insights-customer-support@google.com
# Created Date: Nov 4, 2026
# Modified Date: Nov 4, 2026
# Purpose: Explore for the lightweight context suggestions DT.
# --------------------------------------------------------------------------

include: "/views/*.view.lkml"

explore: lightweight_context_suggestions_dt {
  label: "Lightweight Context Suggestions DT"
  hidden: yes
  description: "Internal helper explore used strictly as the base for dashboard filter suggestions."
}
