#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "const-c.inc"

typedef PerlIO *        OutputStream;
typedef PerlIO *        InputStream;


MODULE = Linux::PipeMagic		PACKAGE = Linux::PipeMagic		
PROTOTYPES: ENABLE

INCLUDE: const-xs.inc

ssize_t
systee(io_in, io_out, len, flags)
    InputStream io_in
    OutputStream io_out
    ssize_t len
    int flags
PREINIT:
    int fd_in = PerlIO_fileno(io_in);
    int fd_out = PerlIO_fileno(io_out);
CODE:
    RETVAL = tee(fd_in, fd_out, len, flags);
OUTPUT:
    RETVAL

