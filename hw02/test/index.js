'use strict';

const assert = require('assert');


describe('should run first test without error', () => {
    it('some test', () => {
        assert.equal(4,4);
    });

    it('broken test', () => {
        assert.equal(4,2);
    });
});
