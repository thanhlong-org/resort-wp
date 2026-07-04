<?php
/**
 * Fallback template. The site is a one-page LP served by front-page.php;
 * this exists to satisfy the WordPress template hierarchy for any other query.
 *
 * @package Ludoa
 */

get_header();
?>
  <main id="top" class="fallback-main" style="min-height:50vh;display:flex;align-items:center;justify-content:center;padding:120px 24px;text-align:center;">
    <div>
      <?php if ( have_posts() ) : ?>
        <?php while ( have_posts() ) : the_post(); ?>
          <article <?php post_class(); ?>>
            <h1><?php the_title(); ?></h1>
            <div><?php the_content(); ?></div>
          </article>
        <?php endwhile; ?>
      <?php else : ?>
        <p><a href="<?php echo esc_url( home_url( '/' ) ); ?>">大自然阿蘇 健康の森</a></p>
      <?php endif; ?>
    </div>
  </main>
<?php
get_footer();
