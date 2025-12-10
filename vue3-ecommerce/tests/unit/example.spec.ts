import { describe, it, expect } from 'vitest';
import { mount } from '@vue/test-utils';
import ExampleComponent from '@/components/common/ExampleComponent.vue'; // Adjust the path as necessary

describe('ExampleComponent', () => {
  it('renders properly', () => {
    const wrapper = mount(ExampleComponent);
    expect(wrapper.exists()).toBe(true);
  });

  it('displays the correct message', () => {
    const message = 'Hello, Vue 3!';
    const wrapper = mount(ExampleComponent, {
      props: { message },
    });
    expect(wrapper.text()).toContain(message);
  });
});