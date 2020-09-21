/*
 * Copyright 2018 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Automatically generated nanopb header */
/* Generated by nanopb-0.3.9.6 */

#ifndef PB_GOOGLE_FIRESTORE_V1_WRITE_NANOPB_H_INCLUDED
#define PB_GOOGLE_FIRESTORE_V1_WRITE_NANOPB_H_INCLUDED
#include <pb.h>

#include "google/api/annotations.nanopb.h"

#include "google/firestore/v1/common.nanopb.h"

#include "google/firestore/v1/document.nanopb.h"

#include "google/protobuf/timestamp.nanopb.h"

#include <string>

namespace firebase {
namespace firestore {

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif


/* Enum definitions */
typedef enum _google_firestore_v1_DocumentTransform_FieldTransform_ServerValue {
    google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_SERVER_VALUE_UNSPECIFIED = 0,
    google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_REQUEST_TIME = 1
} google_firestore_v1_DocumentTransform_FieldTransform_ServerValue;
#define _google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_MIN google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_SERVER_VALUE_UNSPECIFIED
#define _google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_MAX google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_REQUEST_TIME
#define _google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_ARRAYSIZE ((google_firestore_v1_DocumentTransform_FieldTransform_ServerValue)(google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_REQUEST_TIME+1))

/* Struct definitions */
typedef struct _google_firestore_v1_DocumentTransform {
    pb_bytes_array_t *document;
    pb_size_t field_transforms_count;
    struct _google_firestore_v1_DocumentTransform_FieldTransform *field_transforms;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_DocumentTransform) */
} google_firestore_v1_DocumentTransform;

typedef struct _google_firestore_v1_DocumentChange {
    google_firestore_v1_Document document;
    pb_size_t target_ids_count;
    int32_t *target_ids;
    pb_size_t removed_target_ids_count;
    int32_t *removed_target_ids;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_DocumentChange) */
} google_firestore_v1_DocumentChange;

typedef struct _google_firestore_v1_DocumentDelete {
    pb_bytes_array_t *document;
    bool has_read_time;
    google_protobuf_Timestamp read_time;
    pb_size_t removed_target_ids_count;
    int32_t *removed_target_ids;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_DocumentDelete) */
} google_firestore_v1_DocumentDelete;

typedef struct _google_firestore_v1_DocumentRemove {
    pb_bytes_array_t *document;
    pb_size_t removed_target_ids_count;
    int32_t *removed_target_ids;
    google_protobuf_Timestamp read_time;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_DocumentRemove) */
} google_firestore_v1_DocumentRemove;

typedef struct _google_firestore_v1_DocumentTransform_FieldTransform {
    pb_bytes_array_t *field_path;
    pb_size_t which_transform_type;
    union {
        google_firestore_v1_DocumentTransform_FieldTransform_ServerValue set_to_server_value;
        google_firestore_v1_Value increment;
        google_firestore_v1_Value maximum;
        google_firestore_v1_Value minimum;
        google_firestore_v1_ArrayValue append_missing_elements;
        google_firestore_v1_ArrayValue remove_all_from_array;
    };

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_DocumentTransform_FieldTransform) */
} google_firestore_v1_DocumentTransform_FieldTransform;

typedef struct _google_firestore_v1_ExistenceFilter {
    int32_t target_id;
    int32_t count;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_ExistenceFilter) */
} google_firestore_v1_ExistenceFilter;

typedef struct _google_firestore_v1_Write {
    pb_size_t which_operation;
    union {
        google_firestore_v1_Document update;
        pb_bytes_array_t *delete_;
        pb_bytes_array_t *verify;
        google_firestore_v1_DocumentTransform transform;
    };
    bool has_update_mask;
    google_firestore_v1_DocumentMask update_mask;
    bool has_current_document;
    google_firestore_v1_Precondition current_document;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_Write) */
} google_firestore_v1_Write;

typedef struct _google_firestore_v1_WriteResult {
    bool has_update_time;
    google_protobuf_Timestamp update_time;
    pb_size_t transform_results_count;
    struct _google_firestore_v1_Value *transform_results;

    std::string ToString(int indent = 0) const;
/* @@protoc_insertion_point(struct:google_firestore_v1_WriteResult) */
} google_firestore_v1_WriteResult;

/* Default values for struct fields */

/* Initializer values for message structs */
#define google_firestore_v1_Write_init_default   {0, {google_firestore_v1_Document_init_default}, false, google_firestore_v1_DocumentMask_init_default, false, google_firestore_v1_Precondition_init_default}
#define google_firestore_v1_DocumentTransform_init_default {NULL, 0, NULL}
#define google_firestore_v1_DocumentTransform_FieldTransform_init_default {NULL, 0, {_google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_MIN}}
#define google_firestore_v1_WriteResult_init_default {false, google_protobuf_Timestamp_init_default, 0, NULL}
#define google_firestore_v1_DocumentChange_init_default {google_firestore_v1_Document_init_default, 0, NULL, 0, NULL}
#define google_firestore_v1_DocumentDelete_init_default {NULL, false, google_protobuf_Timestamp_init_default, 0, NULL}
#define google_firestore_v1_DocumentRemove_init_default {NULL, 0, NULL, google_protobuf_Timestamp_init_default}
#define google_firestore_v1_ExistenceFilter_init_default {0, 0}
#define google_firestore_v1_Write_init_zero      {0, {google_firestore_v1_Document_init_zero}, false, google_firestore_v1_DocumentMask_init_zero, false, google_firestore_v1_Precondition_init_zero}
#define google_firestore_v1_DocumentTransform_init_zero {NULL, 0, NULL}
#define google_firestore_v1_DocumentTransform_FieldTransform_init_zero {NULL, 0, {_google_firestore_v1_DocumentTransform_FieldTransform_ServerValue_MIN}}
#define google_firestore_v1_WriteResult_init_zero {false, google_protobuf_Timestamp_init_zero, 0, NULL}
#define google_firestore_v1_DocumentChange_init_zero {google_firestore_v1_Document_init_zero, 0, NULL, 0, NULL}
#define google_firestore_v1_DocumentDelete_init_zero {NULL, false, google_protobuf_Timestamp_init_zero, 0, NULL}
#define google_firestore_v1_DocumentRemove_init_zero {NULL, 0, NULL, google_protobuf_Timestamp_init_zero}
#define google_firestore_v1_ExistenceFilter_init_zero {0, 0}

/* Field tags (for use in manual encoding/decoding) */
#define google_firestore_v1_DocumentTransform_document_tag 1
#define google_firestore_v1_DocumentTransform_field_transforms_tag 2
#define google_firestore_v1_DocumentChange_document_tag 1
#define google_firestore_v1_DocumentChange_target_ids_tag 5
#define google_firestore_v1_DocumentChange_removed_target_ids_tag 6
#define google_firestore_v1_DocumentDelete_document_tag 1
#define google_firestore_v1_DocumentDelete_removed_target_ids_tag 6
#define google_firestore_v1_DocumentDelete_read_time_tag 4
#define google_firestore_v1_DocumentRemove_document_tag 1
#define google_firestore_v1_DocumentRemove_removed_target_ids_tag 2
#define google_firestore_v1_DocumentRemove_read_time_tag 4
#define google_firestore_v1_DocumentTransform_FieldTransform_set_to_server_value_tag 2
#define google_firestore_v1_DocumentTransform_FieldTransform_increment_tag 3
#define google_firestore_v1_DocumentTransform_FieldTransform_maximum_tag 4
#define google_firestore_v1_DocumentTransform_FieldTransform_minimum_tag 5
#define google_firestore_v1_DocumentTransform_FieldTransform_append_missing_elements_tag 6
#define google_firestore_v1_DocumentTransform_FieldTransform_remove_all_from_array_tag 7
#define google_firestore_v1_DocumentTransform_FieldTransform_field_path_tag 1
#define google_firestore_v1_ExistenceFilter_target_id_tag 1
#define google_firestore_v1_ExistenceFilter_count_tag 2
#define google_firestore_v1_Write_update_tag     1
#define google_firestore_v1_Write_delete_tag     2
#define google_firestore_v1_Write_verify_tag     5
#define google_firestore_v1_Write_transform_tag  6
#define google_firestore_v1_Write_update_mask_tag 3
#define google_firestore_v1_Write_current_document_tag 4
#define google_firestore_v1_WriteResult_update_time_tag 1
#define google_firestore_v1_WriteResult_transform_results_tag 2

/* Struct field encoding specification for nanopb */
extern const pb_field_t google_firestore_v1_Write_fields[7];
extern const pb_field_t google_firestore_v1_DocumentTransform_fields[3];
extern const pb_field_t google_firestore_v1_DocumentTransform_FieldTransform_fields[8];
extern const pb_field_t google_firestore_v1_WriteResult_fields[3];
extern const pb_field_t google_firestore_v1_DocumentChange_fields[4];
extern const pb_field_t google_firestore_v1_DocumentDelete_fields[4];
extern const pb_field_t google_firestore_v1_DocumentRemove_fields[4];
extern const pb_field_t google_firestore_v1_ExistenceFilter_fields[3];

/* Maximum encoded size of messages (where known) */
/* google_firestore_v1_Write_size depends on runtime parameters */
/* google_firestore_v1_DocumentTransform_size depends on runtime parameters */
/* google_firestore_v1_DocumentTransform_FieldTransform_size depends on runtime parameters */
/* google_firestore_v1_WriteResult_size depends on runtime parameters */
/* google_firestore_v1_DocumentChange_size depends on runtime parameters */
/* google_firestore_v1_DocumentDelete_size depends on runtime parameters */
/* google_firestore_v1_DocumentRemove_size depends on runtime parameters */
#define google_firestore_v1_ExistenceFilter_size 22

/* Message IDs (where set with "msgid" option) */
#ifdef PB_MSGID

#define WRITE_MESSAGES \


#endif

const char* EnumToString(
    google_firestore_v1_DocumentTransform_FieldTransform_ServerValue value);
}  // namespace firestore
}  // namespace firebase

/* @@protoc_insertion_point(eof) */

#endif
