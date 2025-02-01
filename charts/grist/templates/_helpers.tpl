{{/* _helpers.tpl */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "grist.name" -}}
{{- if and .Chart (not (eq .Chart.Name nil)) }}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | quote }}
{{- else }}
"grist-core"
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "grist.fullname" -}}
{{- if and .Values (hasKey .Values "fullnameOverride") .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | quote }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" | quote }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" | quote }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart labels
*/}}
{{- define "grist.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | trunc 63 | trimSuffix "-" | quote }}
{{- end }}

{{/*
Create chart labels.
*/}}
{{- define "grist.labels" -}}
helm.sh/chart: {{ include "grist.chart" . }}
{{ include "grist.selectorLabels" . }}
{{- end -}}

{{/*
Create selector labels.
*/}}
{{- define "grist.selectorLabels" -}}
app.kubernetes.io/name: {{ include "grist.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
