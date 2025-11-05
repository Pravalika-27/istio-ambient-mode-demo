#!/bin/bash
set -e
# Apply a waypoint for the backend service account (requires istioctl)
echo "Applying waypoint for backend service-account..."
istioctl x waypoint apply --service-account backend || true
echo "Waypoint apply finished (check istioctl output for status)."
