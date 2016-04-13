BaseComponent = require '../BaseComponent'
styles        = require './pagination_styles'
ReactPaginate = require 'react-paginate'

class PaginationComponent extends BaseComponent

  render: ->
    <ReactPaginate previousLabel={"<"}
         pageNum={@props.pageNum}
         forceSelected={@props.forceSelected}
         nextLabel={">"}
         breakLabel={<span className=styles.break>...</span>}
         marginPagesDisplayed={2}
         pageRangeDisplayed={2}
         clickCallback={@props.handlePageClick}
         containerClassName={styles.container}
         pageClassName={styles.page}
         subContainerClassName={styles.sub_container}
         pageLinkClassName={styles.link}
         activeClassName={styles.active} 
         previousClassName={styles.page}
         nextClassName={styles.page}
         nextLinkClassName={styles.link}
         previousLinkClassName={styles.link}
         marginPagesDisplayed=1
        />

module.exports = PaginationComponent