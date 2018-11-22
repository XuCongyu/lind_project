/* Copyright (c) 2010, 2018, Oracle and/or its affiliates. All rights reserved.

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License, version 2.0,
  as published by the Free Software Foundation.

  This program is also distributed with certain software (including
  but not limited to OpenSSL) that is licensed under separate terms,
  as designated in a particular file or component or in included license
  documentation.  The authors of MySQL hereby grant you an additional
  permission to link the program and your derivative works with the
  separately licensed software that they have included with MySQL.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License, version 2.0, for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301  USA */

#ifndef TABLE_ETS_BY_THREAD_BY_EVENT_NAME_H
#define TABLE_ETS_BY_THREAD_BY_EVENT_NAME_H

/**
  @file storage/perfschema/table_ets_by_thread_by_event_name.h
  Table EVENTS_TRANSACTIONS_SUMMARY_BY_THREAD_BY_EVENT_NAME (declarations).
*/

#include <sys/types.h>

#include "my_base.h"
#include "my_inttypes.h"
#include "storage/perfschema/pfs_engine_table.h"
#include "storage/perfschema/table_helper.h"

class Field;
class Plugin_table;
struct PFS_thread;
struct PFS_transaction_class;
struct TABLE;
struct THR_LOCK;

/**
  @addtogroup performance_schema_tables
  @{
*/

class PFS_index_ets_by_thread_by_event_name : public PFS_engine_index {
 public:
  PFS_index_ets_by_thread_by_event_name()
      : PFS_engine_index(&m_key_1, &m_key_2),
        m_key_1("THREAD_ID"),
        m_key_2("EVENT_NAME") {}

  ~PFS_index_ets_by_thread_by_event_name() {}

  bool match(PFS_thread *pfs);
  bool match(PFS_transaction_class *klass);

 private:
  PFS_key_thread_id m_key_1;
  PFS_key_event_name m_key_2;
};

/**
  A row of table
  PERFORMANCE_SCHEMA.EVENTS_TRANSACTIONS_SUMMARY_BY_THREAD_BY_EVENT_NAME.
*/
struct row_ets_by_thread_by_event_name {
  /** Column THREAD_ID. */
  ulonglong m_thread_internal_id;
  /** Column EVENT_NAME. */
  PFS_event_name_row m_event_name;
  /**
    Columns COUNT_STAR, SUM/MIN/AVG/MAX_TIMER_WAIT,
    COUNT_READ_WRITE, SUM/MIN/AVG/MAX_TIMER_READ_WRITE,
    COUNT_READ_ONLY, SUM/MIN/AVG/MAX_TIMER_READ_ONLY
  */
  PFS_transaction_stat_row m_stat;
};

/**
  Position of a cursor on
  PERFORMANCE_SCHEMA.EVENTS_TRANSACTIONS_SUMMARY_BY_THREAD_BY_EVENT_NAME.
  Index 1 on thread (0 based).
  Index 2 on transaction class (1 based).
*/
struct pos_ets_by_thread_by_event_name : public PFS_double_index,
                                         public PFS_instrument_view_constants {
  pos_ets_by_thread_by_event_name() : PFS_double_index(0, 1) {}

  inline void reset(void) {
    m_index_1 = 0;
    m_index_2 = 1;
  }

  inline void next_thread(void) {
    m_index_1++;
    m_index_2 = 1;
  }

  inline void next_transaction(void) { m_index_2++; }
};

/** Table
 * PERFORMANCE_SCHEMA.EVENTS_TRANSACTIONS_SUMMARY_BY_THREAD_BY_EVENT_NAME. */
class table_ets_by_thread_by_event_name : public PFS_engine_table {
 public:
  /** Table share */
  static PFS_engine_table_share m_share;
  static PFS_engine_table *create(PFS_engine_table_share *);
  static int delete_all_rows();
  static ha_rows get_row_count();

  virtual void reset_position(void);

  virtual int rnd_init(bool scan);
  virtual int rnd_next();
  virtual int rnd_pos(const void *pos);

  virtual int index_init(uint idx, bool sorted);
  virtual int index_next();

 protected:
  virtual int read_row_values(TABLE *table, unsigned char *buf, Field **fields,
                              bool read_all);

  table_ets_by_thread_by_event_name();

 public:
  ~table_ets_by_thread_by_event_name() {}

 protected:
  int make_row(PFS_thread *thread, PFS_transaction_class *klass);

 private:
  /** Table share lock. */
  static THR_LOCK m_table_lock;
  /** Table definition. */
  static Plugin_table m_table_def;

  /** Current row. */
  row_ets_by_thread_by_event_name m_row;
  /** Current position. */
  pos_ets_by_thread_by_event_name m_pos;
  /** Next position. */
  pos_ets_by_thread_by_event_name m_next_pos;

  PFS_index_ets_by_thread_by_event_name *m_opened_index;
};

/** @} */
#endif
