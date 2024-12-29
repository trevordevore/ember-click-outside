import ClickOutsideModifier from 'ember-click-outside';
import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';

module('Integration | Modifier | on-click-outside GJS', function (hooks) {
  setupRenderingTest(hooks);

  test('smoke test', async function (assert) {
    this.set('didClickOutside', (e) => {
      assert.ok('`didClickOutside` fired only once');
      assert.strictEqual(
        e.target.className,
        'outside',
        'the event object was passed and is correct'
      );
    });

    await render(
      <template>
        <div class="outside">Somewhere, over the rainbow...</div>
        <div {{ClickOutsideModifier this.didClickOutside}} class="inside">We're in</div>
      </template>
    );

    await click('.inside');
    await click('.outside');
  });
});
