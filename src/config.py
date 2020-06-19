#!/usr/bin/python
# -*- coding: utf-8 -*-

import contextlib
import time

@contextlib.contextmanager
def stopwatch(message):
    
    """

    :function:
        - A context manager to print the run time of a block of code.
    :param message:
        - The message pertaining to the block of code to be executed. (str)
    :return:
        - A dictionary containing the message and elapsed time.
    """
    
    t0 = time.time()
    try:
        yield
    finally:
        t1 = time.time()
        print('Total elapsed time for %s: %.3f' % (message, t1 - t0))
        return {
            'message': message,
            'elapsed_time': (t1 - t0)
        }