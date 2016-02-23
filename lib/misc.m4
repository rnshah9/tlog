m4_dnl
m4_dnl Miscellaneous m4 macros.
m4_dnl
m4_dnl Copyright (C) 2016 Red Hat
m4_dnl
m4_dnl This file is part of tlog.
m4_dnl
m4_dnl Tlog is free software; you can redistribute it and/or modify
m4_dnl it under the terms of the GNU General Public License as published by
m4_dnl the Free Software Foundation; either version 2 of the License, or
m4_dnl (at your option) any later version.
m4_dnl
m4_dnl Tlog is distributed in the hope that it will be useful,
m4_dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
m4_dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
m4_dnl GNU General Public License for more details.
m4_dnl
m4_dnl You should have received a copy of the GNU General Public License
m4_dnl along with tlog; if not, write to the Free Software
m4_dnl Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
m4_dnl
m4_dnl
m4_dnl Concatenate arguments into single string
m4_dnl
m4_define(`m4_concat',
          `m4_ifelse(`$#', `0', ,
                     `$#', `1', `$1',
                     `$1`'m4_concat(m4_shift($@))')')m4_dnl
m4_dnl
m4_dnl
m4_dnl Append arguments with newlines and concatenate into a single string.
m4_dnl
m4_define(`m4_concatl',
          `m4_ifelse(`$#', `0', ,
                     `$#', `1', `$1
',
                     `$1
m4_concatl(m4_shift($@))')')m4_dnl
m4_dnl
m4_dnl
m4_dnl Concatenate arguments into diversion 0
m4_dnl Arguments:
m4_dnl
m4_dnl      $@  Text to output
m4_dnl
m4_define(`m4_print', `m4_dnl
m4_pushdef(`orig_diversion', m4_divnum)m4_dnl
m4_divert(0)m4_dnl
m4_concat($@)`'m4_dnl
m4_divert(orig_diversion)m4_dnl
m4_popdef(`orig_diversion')m4_dnl
')m4_dnl
m4_dnl
m4_dnl
m4_dnl Append arguments with newlines and concatenate into diversion 0.
m4_dnl Arguments:
m4_dnl
m4_dnl      $@  Text to output
m4_dnl
m4_define(`m4_printl', `m4_dnl
m4_pushdef(`orig_diversion', m4_divnum)m4_dnl
m4_divert(0)m4_dnl
m4_concatl($@)`'m4_dnl
m4_divert(orig_diversion)m4_dnl
m4_popdef(`orig_diversion')m4_dnl
')m4_dnl
m4_dnl
m4_dnl
m4_dnl Output a warning header about the file being generated.
m4_dnl Arguments:
m4_dnl
m4_dnl      $1  Prefix to put in front of each line
m4_dnl
m4_define(
`m4_generated_warning',
`m4_concatl(
`$1vim:nomodifiable',
`$1',
`$1************************* WARNING! DO NOT EDIT! *************************',
`$1This file is automatically generated from m4___file__.',
`$1*************************************************************************')')m4_dnl
m4_dnl
m4_dnl
m4_dnl Quote the argument in single quotes, as a C character literal.
m4_dnl Arguments:
m4_dnl
m4_dnl      $1  The text to single-quote
m4_dnl
m4_changequote(`[', `]')m4_dnl
m4_define([m4_singlequote], ['$1'])m4_dnl
m4_changequote([`], ['])m4_dnl
m4_dnl
